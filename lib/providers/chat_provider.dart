import 'package:flutter/material.dart';
import 'dart:async';

import 'package:fluttertoast/fluttertoast.dart';

import '../repositories/chat_repository.dart';
import '../utils/timestamp_helper.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../network/network.dart';

enum RequestState{
  initialized,
  loading,
  answering,
  invalidOpenAIAPIKey,
  invalidPaLMAPIKey,
  done,
}

class ChatProvider extends ChangeNotifier {

  final ChatRepository chatRepository;
  final CharactersProvider charactersProvider;
  final ChatRoomsProvider chatRoomsProvider;
  final OpenAIProvider openAIProvider;
  final KeyProvider keyProvider;

  List<ChatMessage> _chatMessages = [];
  List<ChatMessage> get chatMessages => _chatMessages;
  Result<ChatMessage>? _answer;
  Result<ChatMessage>? get answer => _answer;
  RequestState requestState = RequestState.done;

  ChatProvider({required this.chatRepository,
    required this.charactersProvider,
    required this.chatRoomsProvider,
    required this.keyProvider,
    required this.openAIProvider,
  }) {
    //Initialize something
  }

  Future<void> updateChatMessages(String roomId) async {
    _chatMessages = await chatRepository.getChatMessages(roomId);
    notifyListeners();
  }

  Future<void> insertChatMessage(ChatMessage chatMessage) async {
    //if last message is before than 1 day, insert dateChat
    final lastChat = await chatRepository.queryLastChatMessage(chatMessage.roomId);
    final bool shouldInsertDate = isDifferentDay(
        chatMessage.timestamp,
        lastChat != null ? lastChat.timestamp : 0
    );
    if(shouldInsertDate){
      await insertDateChat(chatMessage.roomId, chatMessage.characterId, chatMessage.timestamp);
    }

    await chatRepository.insertChatMessage(chatMessage);
    if(charactersProvider.currentCharacter.id == chatMessage.characterId){
      //update only in case user is in current chatroom
      await updateChatMessages(chatMessage.roomId);
    }
    updateDataAfterCompletion();
  }

  Future<void> insertDateChat(String roomId, String characterId, int timestamp) async {
    final dateChat = ChatMessage(
      roomId: roomId,
      characterId: characterId,
      chatMessageType: ChatMessageType.date,
      timestamp: timestamp,
      role: "",
      content: "",
    );
    await chatRepository.insertChatMessage(dateChat);
  }

  Future<void> updateOneChatMessage(ChatMessage chatMessage) async {
    await chatRepository.updateOneChatMessage(chatMessage);
    await updateChatMessages(chatMessage.roomId);
  }

  Future<void> updateStreamChatMessage(ChatMessage chatMessage) async {
    await chatRepository.updateStreamChatMessage(chatMessage);
    await updateChatMessages(chatMessage.roomId);
  }

  Future<void> deleteOneChatMessage(String id,String roomId) async {
    await chatRepository.deleteOneChatMessage(id);
    await updateChatMessages(roomId);
  }

  Future<void> deleteChatMessages(List<ChatMessage> messagesToDelete, String roomId) async {
    await chatRepository.deleteChatMessages(messagesToDelete);
    await updateChatMessages(roomId);
    await findDatesToDelete(roomId);
  }

  Future<void> findDatesToDelete(String roomId) async {
    List<ChatMessage> messagesToDelete = [];
    if (chatMessages.length == 1 && chatMessages[0].chatMessageType == ChatMessageType.date) {
      messagesToDelete.add(chatMessages[0]);
    } else if (chatMessages.length >1){
      for (int i = 0; i < chatMessages.length - 1; i++) {
        ChatMessage currentMessage = chatMessages[i];
        ChatMessage nextMessage = chatMessages[i + 1];

        if (currentMessage.chatMessageType == ChatMessageType.date &&
            (nextMessage.chatMessageType != ChatMessageType.userMessage &&
                nextMessage.chatMessageType != ChatMessageType.characterMessage)) {
          messagesToDelete.add(currentMessage);
        }

        if (chatMessages.isNotEmpty &&
            chatMessages.last.chatMessageType == ChatMessageType.date) {
          messagesToDelete.add(chatMessages.last);
        }
      }
    }
    await chatRepository.deleteChatMessages(messagesToDelete);
    await updateChatMessages(roomId);
  }

  /*
  Services
  */
  Future<void> openAIStreamCompletion(
      OpenAIService openAIParams,
      List<ChatMessage> chatMessages,
      String roomId,
      Character character
    ) async {
    if(keyProvider.openAPIKey==null || keyProvider.openAPIKey!.isEmpty){
      setRequestState(RequestState.invalidOpenAIAPIKey);
    } else {
      setRequestState(RequestState.loading);
      try{
        final answerStream = await openAIProvider.requestChatStream(
          keyProvider.openAPIKey!,
          openAIParams,
          chatMessages,
          character
        );

        String answerTemp = "";
        final firstMessage = ChatMessage.firstMessage(roomId, character.id!, answerTemp);
        answerStream.handleError((error) {
          debugPrint("stream error : ${error}");
          if (error.statusCode == 401){
            setRequestState(RequestState.invalidOpenAIAPIKey);
          } else {
            showToastMessage('${error.message}');
            setRequestState(RequestState.done);
          }
        }).listen((event) async {
          if (event.choices.first.delta.role == "assistant") {
            // deal with first index of the event
          } else if (event.choices.first.finishReason==null && event.choices.first.delta.role==null && event.choices.first.delta.content != null) {
            // during stream in answering
            setRequestState(RequestState.answering);
            answerTemp += event.choices.first.delta.content!;
            ChatMessage answerMessage = ChatMessage(
              id: firstMessage.id!,
              roomId: firstMessage.roomId,
              characterId: firstMessage.characterId,
              chatMessageType: firstMessage.chatMessageType,
              timestamp: firstMessage.timestamp,
              role: "assistant",
              content: answerTemp,
            );
            await updateStreamChatMessage(answerMessage);
          } else if (event.choices.first.finishReason != null) {
            // deal with done
          }
        }, onDone: () async {
          updateDataAfterCompletion();
          setRequestState(RequestState.done);
        });
      } catch (e){
        debugPrint("Error during Stream: $e");
        showToastMessage('$e');
        setRequestState(RequestState.done);
      }
    }
  }

  Future<void> paLMChatCompletion(
      PaLMService paLMParams,
      List<ChatMessage> chatMessages,
      String roomId,
      Character character
    ) async {
    if (keyProvider.paLMAPIKey == null || keyProvider.paLMAPIKey!.isEmpty){
      setRequestState(RequestState.invalidPaLMAPIKey);
    } else {
      try{
        setRequestState(RequestState.loading);
        final response = await PaLM.requestChat(
            keyProvider.paLMAPIKey!,
            paLMParams,
            chatMessages,
            character
        );
        response.fold(
            success: (value) async {
              if (value.candidates!=null){
                final answer = ChatMessage(
                    roomId: roomId,
                    characterId: character.id!,
                    chatMessageType: ChatMessageType.characterMessage,
                    timestamp: getTimestamp(),
                    role: "assistant",
                    content: value.candidates!.first.content
                );
                await insertChatMessage(answer);
                updateDataAfterCompletion();
                setRequestState(RequestState.done);
              } else if (value.candidates== null && value.filters != null){
                debugPrint("error : ${value}");
                showToastMessage("Content filtered due to: \"${value.filters!.first.reason.name}\"");
                setRequestState(RequestState.done);
              }
            },
            error: (value){
              debugPrint("error : ${value}");
              setRequestState(RequestState.done);
              showToastMessage(value.errorMessage);
            }
        );
      } catch (e){
        debugPrint("Error during Stream: $e");
        showToastMessage('$e');
        setRequestState(RequestState.done);
      }
    }
  }

  void setRequestState(RequestState state){
    requestState = state;
    notifyListeners();
  }

  void showToastMessage(String message) {
    Fluttertoast.showToast( // All property will be ignored in above Android 11
        msg: "Error : $message",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  Future<void> updateDataAfterCompletion() async{
    await chatRoomsProvider.updateChatRooms();
  }

  Future<void> setKeyboardHeight(double keyboardHeight) async{
    await chatRepository.setKeyboardHeight(keyboardHeight);
  }

  double getKeyboardHeight(BuildContext context) {
    return chatRepository.getKeyboardHeight() ?? MediaQuery.of(context).size.height*0.3;
  }

}
