import 'package:flutter/material.dart';

import 'package:dart_openai/dart_openai.dart';
import 'package:tiktoken/tiktoken.dart' as tiktokenizer;

import '../repositories/openai_repository.dart';
import '../models/models.dart';
import '../constants/openai_constants.dart';

const openAIOutputTokenSafetyMargin = 800;

const openAIMaximumToken = {
  OpenAIConstants.gpt3halfTurboId : 4097,
  OpenAIConstants.gpt4Id: 8192,
  OpenAIConstants.gpt432kId: 32768
};

class OpenAIProvider extends ChangeNotifier {

  OpenAIProvider({required this.openAIRepository}){

  }

  final OpenAIRepository openAIRepository;

  Future<Stream<OpenAIStreamChatCompletionModel>> requestChatStream(
      String key,
      OpenAIService openAIParams,
      List<ChatMessage> chatMessages,
      Character character
      ) async {
    List<OpenAIChatCompletionChoiceMessageModel> messages = formattingToOpenAI(chatMessages);
    messages = embedSystemPrompts(messages, openAIParams, character);
    messages = limitInputTokens(
        messages,
        openAIMaximumToken[openAIParams.modelId]!,
        openAIParams.modelId!
    );
    return await openAIRepository.requestChatStream(key, openAIParams.modelId!, messages, openAIParams.temperature);
  }

  List<OpenAIChatCompletionChoiceMessageModel> formattingToOpenAI(List<ChatMessage> chatMessages) {
    return chatMessages
        .where((message) => message.chatMessageType != ChatMessageType.date)
        .map((message) => OpenAIChatCompletionChoiceMessageModel(
      content: message.content,
      role: message.role == 'user'
          ? OpenAIChatMessageRole.user
          : OpenAIChatMessageRole.assistant,
    ))
        .toList();
  }

  List<OpenAIChatCompletionChoiceMessageModel> embedSystemPrompts(
      List<OpenAIChatCompletionChoiceMessageModel> chatMessages,
      OpenAIService openAIParams,
      Character character
      ){
    final systemPrompts = [];
    if (openAIParams.systemPrompt.isNotEmpty){
      systemPrompts.add(
        OpenAIChatCompletionChoiceMessageModel(
          content: formattingSystemPrompt(openAIParams.systemPrompt, character),
          role: OpenAIChatMessageRole.system,
        )
      );
    }
    if (openAIParams.characterPrompt.isNotEmpty){
      systemPrompts.add(
        OpenAIChatCompletionChoiceMessageModel(
          content: formattingSystemPrompt(openAIParams.characterPrompt, character),
          role: OpenAIChatMessageRole.system,
        )
      );
    }
    return systemPrompts.isEmpty ? chatMessages : [...systemPrompts, ...chatMessages];
  }

  static String formattingSystemPrompt(String chat, Character character){
    return chat.replaceAll('<user>', character.userName).replaceAll('<chatter>', character.botName);
  }

  List<OpenAIChatCompletionChoiceMessageModel> limitInputTokens(
      List<OpenAIChatCompletionChoiceMessageModel> chatMessages,
      int tokenLimitation,
      String modelId
      ){
    int totalTokens=0;
    List<OpenAIChatCompletionChoiceMessageModel> filteredList = [];
    int outputTokenSafetyMargin = tokenLimitation > openAIOutputTokenSafetyMargin ? openAIOutputTokenSafetyMargin : 0;

    List<OpenAIChatCompletionChoiceMessageModel> systemTemp = [];
    chatMessages.removeWhere((chat) {
      if (chat.role == OpenAIChatMessageRole.system) {
        totalTokens += numTokensFromString(chat.content, modelId);
        systemTemp.add(chat);
        return true;
      }
      return false;
    });

    for(var chat in chatMessages.reversed){
      totalTokens += numTokensFromString(chat.content, modelId);
      if(totalTokens < tokenLimitation-outputTokenSafetyMargin){
        filteredList.add(chat);
      } else{
        debugPrint("Context tokens are : $totalTokens ,Context token exceed Maximum ${tokenLimitation-outputTokenSafetyMargin} (tokenLimitation-ensuredTokenForAnswer) tokens, returns filteredList");
        return [...systemTemp, ...filteredList.reversed.toList()];
      }
    }
    debugPrint("Context tokens are : $totalTokens ,token does not exceed Maximum ${tokenLimitation-outputTokenSafetyMargin} (tokenLimitation-ensuredTokenForAnswer) tokens. returns the list itself");
    return [...systemTemp, ...filteredList.reversed.toList()];
  }

  int numTokensFromString(String string, String modelName) {
    final encoding = tiktokenizer.encodingForModel(modelName);
    final numTokens = encoding.encode(string).length;
    return numTokens;
  }


}