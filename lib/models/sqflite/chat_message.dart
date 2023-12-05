import 'package:uuid/uuid.dart';

import '../../utils/timestamp_helper.dart';
import '../../localdb/localdb.dart';
import 'character.dart';

enum ChatMessageType { date, userMessage, characterMessage, indicator }

class ChatMessage {
  final String? id;
  final String roomId;
  final String characterId;
  final ChatMessageType chatMessageType;
  final int timestamp;
  final String role;
  final String content;
  bool isEditable;

  ChatMessage({
    this.id,
    required this.roomId,
    required this.characterId,
    required this.chatMessageType,
    required this.timestamp,
    required this.role,
    required this.content,
    this.isEditable=false,
  });

  Map<String, dynamic> toMap() {
    var uuid = const Uuid();
    return {
      SQFliteHelper.chatMessageColumnId: id ?? uuid.v4(),
      SQFliteHelper.chatMessageColumnRoomId: roomId,
      SQFliteHelper.chatMessageColumnCharacterId: characterId,
      SQFliteHelper.chatMessageColumnChatMessageType: chatMessageType.index,
      SQFliteHelper.chatMessageColumnTimestamp: timestamp,
      SQFliteHelper.chatMessageColumnRole: role,
      SQFliteHelper.chatMessageColumnContent: content,
      SQFliteHelper.chatMessageColumnIsEditable: isEditable ? 1 : 0,
    };
  }

  factory ChatMessage.fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      id: map[SQFliteHelper.chatMessageColumnId] as String?,
      roomId: map[SQFliteHelper.chatMessageColumnRoomId] as String,
      characterId: map[SQFliteHelper.chatMessageColumnCharacterId] as String,
      chatMessageType: ChatMessageType.values[map[SQFliteHelper.chatMessageColumnChatMessageType] as int],
      timestamp: map[SQFliteHelper.chatMessageColumnTimestamp] as int,
      role: map[SQFliteHelper.chatMessageColumnRole] as String,
      content: map[SQFliteHelper.chatMessageColumnContent] as String,
      isEditable: (map[SQFliteHelper.chatMessageColumnIsEditable] as int) == 1,
    );
  }

  factory ChatMessage.indicatorPlaceHolder(){
    return ChatMessage(
        roomId: "",
        characterId: "",
        chatMessageType: ChatMessageType.indicator,
        timestamp: -1,
        role: "",
        content: ""
    );
  }

  factory ChatMessage.firstMessage(String roomId, String characterId, String content){
    var uuid = const Uuid();
    return ChatMessage(
      id: uuid.v4(),
      roomId: roomId,
      characterId: characterId,
      chatMessageType: ChatMessageType.characterMessage,
      timestamp: getTimestamp(),
      role: "assistant",
      content: content
    );
  }

  factory ChatMessage.firstStreamChatMessage(String roomId, String characterId, int timestamp){
    var uuid = const Uuid();
    return ChatMessage(
        id: uuid.v4(),
        roomId: roomId,
        characterId: characterId,
        chatMessageType: ChatMessageType.characterMessage,
        timestamp: timestamp,
        role: "assistant",
        content: ""
    );
  }

  @override
  String toString() {
    return 'ChatMessage(Id: $id, roomId: $roomId, characterId: $characterId, chatMessageType: $chatMessageType, timestamp: $timestamp, role: $role, content: $content, isEditable: $isEditable)';
  }
}
