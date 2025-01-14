import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/models.dart';
import '../utils/default_characters.dart';


class SQFliteHelper {
  //database
  static final _databaseName = 'chattercrafting_database.db';
  static String get databaseName => _databaseName;
  static final _databaseVersion = 1;
  //chatRoom Table
  static final chatRoomTable = 'chat_rooms';
  static final chatRoomColumnId = '_id';
  static final chatRoomColumnCharacterId = 'character_id';
  static final chatRoomColumnUserName = 'user_name';
  static final chatRoomColumnBotName = 'bot_name';
  static final chatRoomColumnBotPhotoBLOB = 'photo_blob';
  //chatMessage Table
  static final chatMessageTable = 'chat_messages';
  static final chatMessageColumnId = '_id';
  static final chatMessageColumnRoomId = 'chat_room_id';
  static final chatMessageColumnCharacterId = 'character_id';
  static final chatMessageColumnChatMessageType = 'type';
  static final chatMessageColumnTimestamp = 'timestamp';
  static final chatMessageColumnRole = 'role';
  static final chatMessageColumnContent = 'content';
  static final chatMessageColumnIsEditable = 'is_editable';
  //User Table
  static final users_table = 'users';
  static final userColumnId = '_id';
  static final userColumnUid = 'uid';
  static final userColumnEmail = 'email';
  static final userColumnNickname = 'nickname';
  static final userColumnPhotoUrl = 'photo_url';
  //Character Table
  static final charactersTable = 'characters';
  static final charactersColumnId = '_id';
  static final charactersColumnBotPhotoBLOB = 'photo_blob';
  static final charactersColumnBotBackgroundPhotoBLOB = 'background_photo_blob';
  static final charactersColumnBotName = 'bot_name';
  static final charactersColumnUserName = 'user_name';
  static final charactersColumnFirstMessage= 'first_message';
  static final charactersColumnService = 'service';
  //OpenAI
  static final openAITable = 'openAI';
  static final openAIColumnId = '_id';
  static final openAIColumnServiceType = 'service_type';
  static final openAIColumnCharacterId = 'character_id';
  static final openAIColumnModelName = 'model_name';
  static final openAIColumnModelId = 'model_id';
  static final openAIColumnTemperature = 'temperature';
  static final openAIColumnSystemPrompt = 'system_prompt';
  static final openAIColumnCharacterPrompt = 'character_prompt';
  //PaLM
  static final paLMTable = 'paLM';
  static final paLMColumnId = '_id';
  static final paLMColumnServiceType = 'service_type';
  static final paLMColumnCharacterId = 'character_id';
  static final paLMColumnModelName = 'model_name';
  static final paLMColumnModelId = 'model_id';
  static final paLMColumnTemperature = 'temperature';
  static final paLMColumnCandidateCount = 'candidate_count';
  static final paLMColumnContext = 'context';
  static final paLMColumnExampleInput = 'example_input';
  static final paLMColumnExampleOutput = 'example_output';

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDBPath();

    return await openDatabase(
      databasePath,
      version: _databaseVersion,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON'); // Enable DELETE CASCADE
      },
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $users_table (
      $userColumnId INTEGER PRIMARY KEY,
      $userColumnUid TEXT NOT NULL,
      $userColumnEmail TEXT NOT NULL,
      $userColumnNickname TEXT NOT NULL,
      $userColumnPhotoUrl TEXT NOT NULL
    )
    ''');

    await db.execute('''
    CREATE TABLE $charactersTable (
      $charactersColumnId TEXT PRIMARY KEY,
      $charactersColumnBotPhotoBLOB BLOB NOT NULL,      
      $charactersColumnBotBackgroundPhotoBLOB BLOB NOT NULL,            
      $charactersColumnBotName TEXT NOT NULL,
      $charactersColumnUserName TEXT NOT NULL,
      $charactersColumnFirstMessage TEXT NOT NULL,
      $charactersColumnService TEXT NOT NULL
    )
    ''');

    await db.execute('''
    CREATE TABLE $chatRoomTable (
      $chatRoomColumnId TEXT PRIMARY KEY,
      $chatRoomColumnCharacterId TEXT NOT NULL,
      $chatRoomColumnUserName TEXT NOT NULL,
      $chatRoomColumnBotName TEXT NOT NULL,
      $chatRoomColumnBotPhotoBLOB BLOB NOT NULL,      
      FOREIGN KEY ($chatRoomColumnCharacterId) REFERENCES $charactersTable($charactersColumnId) ON DELETE CASCADE
    )
    ''');

    await db.execute('''
    CREATE TABLE $chatMessageTable (
      $chatMessageColumnId TEXT PRIMARY KEY,
      $chatMessageColumnCharacterId TEXT NOT NULL,
      $chatMessageColumnRoomId TEXT NOT NULL,
      $chatMessageColumnChatMessageType INTEGER NOT NULL,
      $chatMessageColumnTimestamp INTEGER NOT NULL,
      $chatMessageColumnRole TEXT NOT NULL,
      $chatMessageColumnContent TEXT NOT NULL,
      $chatMessageColumnIsEditable INTEGER NOT NULL,
      FOREIGN KEY ($chatMessageColumnRoomId) REFERENCES $chatRoomTable($chatRoomColumnId) ON DELETE CASCADE,
      FOREIGN KEY ($chatMessageColumnCharacterId) REFERENCES $charactersTable($charactersColumnId) ON DELETE CASCADE
    )
    ''');
  }

  Future<String> getDBPath() async {
    final path = await getDatabasesPath();
    return join(path, _databaseName);
  }

  Future<void> clearDatabase() async {
    if (_database != null && _database!.isOpen) {
      await _database!.close();
    }
    _database = null;
  }

  Future<List<SQFLiteUser>> getUsers() async {
    final db = await database;
    final maps = await db.query(users_table);

    return List.generate(maps.length, (i) {
      return SQFLiteUser.fromMap(maps[i]);
    });
  }

  Future<SQFLiteUser> getOneUser(String uid) async {
    final db = await database;
    final maps = await db.query(
      users_table,
      where: '$userColumnUid = ?',
      whereArgs: [uid],
    );

    return SQFLiteUser.fromMap(maps.first);
  }

  Future<List<ChatRoom>> getChatRooms() async {
    final db = await database;
    final maps = await db.query(chatRoomTable);

    return List.generate(maps.length, (i) {
      return ChatRoom.fromMap(maps[i]);
    });
  }

  Future<ChatRoom> getOneChatRoom(String characterId) async {
    final db = await database;
    final maps = await db.query(
      chatRoomTable,
      where: '$chatRoomColumnCharacterId = ?',
      whereArgs: [characterId],
    );

    return ChatRoom.fromMap(maps.first);
  }

  Future<ChatMessage?> getLastChatMessage(String roomId) async {
    final db = await database;
    final maps = await db.query(
      chatMessageTable,
      where: '$chatMessageColumnRoomId = ? AND $chatMessageColumnChatMessageType != ?',
      whereArgs: [roomId, ChatMessageType.date.index],
      orderBy: '$chatMessageColumnTimestamp DESC',
      limit: 1,
    );

    if (maps.isNotEmpty){
      return ChatMessage.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<ChatMessage>> getChatMessages(String roomId) async {
    final db = await database;
    final maps = await db.query(
      chatMessageTable,
      where: '$chatMessageColumnRoomId = ?',
      whereArgs: [roomId],
    );

    return List.generate(maps.length, (i) {
      return ChatMessage.fromMap(maps[i]);
    });
  }

  Future<List<Character>> getCharacters() async {
    final db = await database;
    final maps = await db.query(charactersTable);

    return List.generate(maps.length, (i) {
      return Character.fromMap(maps[i]);
    });
  }

  Future<Character> getOneCharacter(String characterId) async {
    final db = await database;
    final maps = await db.query(
      charactersTable,
      where: '$charactersColumnId = ?',
      whereArgs: [characterId],
    );

    return Character.fromMap(maps.first);
  }

  Future<void> insertOrUpdateUser(SQFLiteUser user) async {
    final db = await database;
    final existingUser = await db.query(
      users_table,
      where: '$userColumnUid = ?',
      whereArgs: [user.uid],
    );
    if (existingUser.isNotEmpty) {
      await updateUser(user);
    } else {
      await db.insert(users_table, user.toMap());
    }
  }

  Future<void> insertChatRoom(Character character) async {
    final db = await database;
    final List<Map<String, dynamic>> existingChatroom = await db.query(
      chatRoomTable,
      where: '$chatRoomColumnCharacterId = ?',
      whereArgs: [character.id],
    );
    if(existingChatroom.isEmpty){
      ChatRoom chatRoom = ChatRoom(
        characterId: character.id!,
        userName: character.userName,
        botName: character.botName,
        photoBLOB: character.photoBLOB,
      );
      await db.insert(chatRoomTable, chatRoom.toMap());
    }
  }

  Future<void> insertChatMessage(ChatMessage chatMessage) async {
    final db = await database;
    await db.insert(chatMessageTable, chatMessage.toMap());
  }

  Future<void> insertFirstMessage(Character character, ChatMessage firstMessage) async {
    if (character.firstMessage.isNotEmpty){
      final db = await database;
      final List<Map<String, dynamic>> existingMessages = await db.query(
        chatMessageTable,
        where: '$chatMessageColumnCharacterId = ? AND $chatMessageColumnChatMessageType != ?',
        whereArgs: [character.id, ChatMessageType.date.index],
      );
      final List<Map<String, dynamic>> existingChatroom = await db.query(
        chatRoomTable,
        where: '$chatRoomColumnCharacterId = ?',
        whereArgs: [character.id],
      );
      if (existingMessages.isEmpty && existingChatroom.isEmpty) {
        // insert ChatRoom
        final chatRoom = ChatRoom(
          id: firstMessage.roomId,
          characterId: character.id!,
          userName: character.userName,
          botName: character.botName,
          photoBLOB: character.photoBLOB,
          // lastMessage: firstMessage.content,
          // lastMessageTimestamp: firstMessage.timestamp
        );
        await db.insert(chatRoomTable, chatRoom.toMap());
        final dateChat = ChatMessage(
          roomId: firstMessage.roomId,
          characterId: character.id!,
          chatMessageType: ChatMessageType.date,
          timestamp: firstMessage.timestamp,
          role: "",
          content: "",
        );
        // insert firstMessage
        await db.insert(chatMessageTable, dateChat.toMap());
        await db.insert(chatMessageTable, firstMessage.toMap());
      }
    }
  }

  Future<void> insertOrUpdateCharacter(Character character) async {
    final db = await database;
    final List<Map<String, dynamic>> existingCharacter = await db.query(
      charactersTable,
      where: '$charactersColumnId = ?',
      whereArgs: [character.id],
    );
    if(existingCharacter.isEmpty){
      debugPrint('debug: Insert Character : ${character.botName}');
      await db.insert(charactersTable, character.toMap());
    } else {
      debugPrint('debug: Update Character : ${character.botName}');
      await updateCharacter(character);

      // update Chatroom
      final List<Map<String, dynamic>> existingChatroom = await db.query(
        chatRoomTable,
        where: '$chatRoomColumnCharacterId = ?',
        whereArgs: [character.id],
      );
      if(existingChatroom.isNotEmpty){
        ChatRoom chatRoom = ChatRoom.fromMap(existingChatroom.first);
        final updatedChatRoom = ChatRoom(
            id: chatRoom.id!,
            characterId: character.id!,
            userName: character.userName,
            botName: character.botName,
            photoBLOB: character.photoBLOB,
            lastMessageTimestamp: chatRoom.lastMessageTimestamp,
            lastMessage: chatRoom.lastMessage
        );
        await updateChatRoom(updatedChatRoom);
      }
    }
  }

  Future<void> insertDefaultCharacters(String userName) async {
    final db = await database;
    final count = Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $charactersTable'));
    if (count == 0) {
      final List<Character> defaultCharacters = await getDefaultCharacters(userName);
      debugPrint("getDefaultCharacters : $defaultCharacters");
      for (final character in defaultCharacters) {
        await insertOrUpdateCharacter(character);
      }
    }
  }

  Future<void> updateUser(SQFLiteUser user) async {
    final db = await database;
    await db.update(
      users_table,
      user.toMap(),
      where: '$userColumnUid = ?',
      whereArgs: [user.uid],
    );
  }

  Future<void> updateChatRoom(ChatRoom chatRoom) async {
    final db = await database;
    await db.update(
      chatRoomTable,
      chatRoom.toMap(),
      where: '$chatRoomColumnId = ?',
      whereArgs: [chatRoom.id],
    );
  }

  Future<void> updateOneChatMessage(ChatMessage chatMessage) async {
    final db = await database;
    await db.update(
      chatMessageTable,
      chatMessage.toMap(),
      where: '$chatMessageColumnId = ?',
      whereArgs: [chatMessage.id],
    );
  }

  Future<void> updateStreamChatMessage(ChatMessage chatMessage) async {
    final db = await database;

    // Query to find the latest record with the same characterId and roomId
    List<Map<String, dynamic>> existingRecords = await db.query(
      chatMessageTable,
      where: '${SQFliteHelper.chatMessageColumnId} = ?',
      whereArgs: [chatMessage.id],
    );

    if (existingRecords.isNotEmpty) {
      // If a record exists, update it
      await db.update(
        chatMessageTable,
        chatMessage.toMap(),
        where: '${SQFliteHelper.chatMessageColumnId} = ?',
        whereArgs: [existingRecords.first[SQFliteHelper.chatMessageColumnId]],
      );
    } else {
      // If no record exists, insert the new one
      await db.insert(
        chatMessageTable,
        chatMessage.toMap(),
      );
    }
  }

  Future<void> updateCharacter(Character character) async {
    final db = await database;
    await db.update(
      charactersTable,
      character.toMap(),
      where: '$charactersColumnId = ?',
      whereArgs: [character.id],
    );
  }

  Future<void> deleteUser(String uid) async {
    final db = await database;
    await db.delete(
      users_table,
      where: '$userColumnUid = ?',
      whereArgs: [uid],
    );
  }

  Future<void> deleteChatRoom(String id) async {
    final db = await database;
    await db.delete(
      chatRoomTable,
      where: '$chatRoomColumnId = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteOneChatMessage(String id) async {
    final db = await database;
    await db.delete(
      chatMessageTable,
      where: '$chatMessageColumnId = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteChatMessages(List<ChatMessage> messagesToDelete) async {
    final db = await database;
    final batch = db.batch();

    for (var message in messagesToDelete) {
      batch.delete(
        chatMessageTable,
        where: '$chatMessageColumnId = ?',
        whereArgs: [message.id],
      );
    }

    // Commit the batch operation
    await batch.commit(noResult: true);
  }

  Future<void> deleteCharacter(String id) async {
    final db = await database;
    await db.delete(
      charactersTable,
      where: '$charactersColumnId = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteDB() async {
    final String existingDbPath = await getDBPath();
    final File file = File(existingDbPath);
    if (await file.exists()) {
      await file.delete();
    }
  }
}