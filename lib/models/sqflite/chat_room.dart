import 'dart:typed_data';

import 'package:uuid/uuid.dart';

import 'character.dart';
import '../../localdb/localdb.dart';

class ChatRoom {
  final String? id;
  final String characterId;
  final String userName;
  final String botName;
  final Uint8List photoBLOB;
  String? lastMessage;
  int? lastMessageTimestamp;

  ChatRoom({
    this.id,
    required this.characterId,
    required this.userName,
    required this.botName,
    required this.photoBLOB,
    this.lastMessage,
    this.lastMessageTimestamp,
  });

  Map<String, dynamic> toMap() {
    var uuid = const Uuid();
    return {
      SQFliteHelper.chatRoomColumnId: id ?? uuid.v4(),
      SQFliteHelper.chatRoomColumnCharacterId: characterId,
      SQFliteHelper.chatRoomColumnUserName: userName,
      SQFliteHelper.chatRoomColumnBotName: botName,
      SQFliteHelper.chatRoomColumnBotPhotoBLOB: photoBLOB,
    };
  }

  factory ChatRoom.fromMap(Map<String, dynamic> map) {
    return ChatRoom(
      id: map[SQFliteHelper.chatRoomColumnId] as String?,
      characterId: map[SQFliteHelper.chatRoomColumnCharacterId] as String,
      userName: map[SQFliteHelper.chatRoomColumnUserName] as String,
      botName: map[SQFliteHelper.chatRoomColumnBotName] as String,
      photoBLOB: map[SQFliteHelper.chatRoomColumnBotPhotoBLOB] as Uint8List,
    );
  }

  factory ChatRoom.emptyChatRoom() {
    return ChatRoom(
        characterId: "",
        userName: "",
        botName: "",
        photoBLOB: Uint8List(0),
        lastMessage: "",
        lastMessageTimestamp: -1
    );
  }

  factory ChatRoom.firstChatRoom(Character character){
    var uuid = const Uuid();
    return ChatRoom(
      id: uuid.v4(),
      characterId: character.id!,
      userName: character.userName,
      botName: character.botName,
      photoBLOB: character.photoBLOB
    );
  }

  @override
  String toString() {
    return 'ChatRoom(id: $id, characterId: $characterId, userName: $userName, botName: $botName, photoBLOB: ${photoBLOB.length} bytes, lastMessage: $lastMessage, lastMessageTimestamp: $lastMessageTimestamp)';
  }
}
