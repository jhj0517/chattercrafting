import 'package:flutter/material.dart';

import '../repositories/chat_room_repository.dart';
import '../models/models.dart';

class ChatRoomsProvider extends ChangeNotifier{

  final ChatRoomRepository chatRoomsRepository;

  List<ChatRoom> _chatRooms = [];
  List<ChatRoom> get chatRooms => _chatRooms;

  ChatRoom _currentChatRoom = ChatRoom.emptyChatRoom();
  ChatRoom get currentChatRoom => _currentChatRoom;

  ChatRoomSetting _chatRoomSetting = ChatRoomSetting.defaultChatRoomSetting();
  ChatRoomSetting get chatRoomSetting => _chatRoomSetting;

  ChatRoomsProvider({required this.chatRoomsRepository}) {
    //Initialize something
    updateChatRooms();
  }

  Future<void> updateChatRooms() async{
    _chatRooms = await chatRoomsRepository.getChatRooms();
    //insert last chat data to ChatRooms
    if(chatRooms.isNotEmpty){
      for(var room in _chatRooms){
        final lastChat = await chatRoomsRepository.getLastChat(room.id!);
        if(lastChat != null){
          room.lastMessage = lastChat.content;
          room.lastMessageTimestamp = lastChat.timestamp;
          debugPrint("chatRoom LastMessage Updated");
        }
      }
    }
    notifyListeners();
  }

  Future<void> updateOneChatRoom(ChatRoom chatRoom) async{
    await chatRoomsRepository.updateOneChatRoom(chatRoom);
    await updateChatRooms();
  }

  Future<void> updateCurrentChatRoom(String characterId) async{
    _currentChatRoom = await chatRoomsRepository.getOneChatroom(characterId);
    notifyListeners();
  }

  Future<void> insertChatRoom(Character character) async{
    await chatRoomsRepository.insertChatRoom(character);
    await updateChatRooms();
  }

  Future<void> deleteChatRoom(String chatRoomId) async{
    await chatRoomsRepository.deleteChatRoom(chatRoomId);
    await updateChatRooms();
  }

  Future<void> saveChatRoomSetting(ChatRoomSetting setting) async{
    _chatRoomSetting = setting;
    chatRoomsRepository.saveChatRoomSetting(setting);
    notifyListeners();
  }

  Future<void> readChatRoomSetting() async{
    final setting = await chatRoomsRepository.getChatRoomSetting();
    _chatRoomSetting = setting;
    notifyListeners();
  }

}