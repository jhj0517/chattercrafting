import 'package:flutter/cupertino.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:uuid/uuid.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../localdb/localdb.dart';
import '../../constants/openai_constants.dart';
import '../services/i_service.dart';
import '../services/openai_service.dart';
import '../services/palm_service.dart';

class Character {
  final String? id;
  final Uint8List photoBLOB;
  final Uint8List backgroundPhotoBLOB;
  final String botName;
  final String userName;
  final String photoUrl;
  final String backgroundPhotoUrl;
  final String firstMessage;
  final IService service;

  Character({
    this.id,
    required this.photoBLOB,
    required this.backgroundPhotoBLOB,
    required this.botName,
    required this.userName,
    required this.firstMessage,
    required this.service,
    this.photoUrl="",
    this.backgroundPhotoUrl=""
  });

  Map<String, dynamic> toMap() {
    var uuid = const Uuid();
    return {
      SQFliteHelper.charactersColumnId: id ?? uuid.v4(),
      SQFliteHelper.charactersColumnBotPhotoBLOB: photoBLOB,
      SQFliteHelper.charactersColumnBotBackgroundPhotoBLOB: backgroundPhotoBLOB,
      SQFliteHelper.charactersColumnBotName: botName,
      SQFliteHelper.charactersColumnUserName: userName,
      SQFliteHelper.charactersColumnFirstMessage: firstMessage,
      SQFliteHelper.charactersColumnService: json.encode(service.toMap()), // Encode the service as JSON
    };
  }

  factory Character.fromMap(Map<String, dynamic> map) {
    IService service;
    Map<String, dynamic> serviceMap = json.decode(map[SQFliteHelper.charactersColumnService] as String); // Decode the JSON
    ServiceType type = ServiceType.values[serviceMap['service_type'] as int];
    switch (type) {
      case ServiceType.openAI:
        service = OpenAIService.fromMap(serviceMap);
        break;
      case ServiceType.paLM:
        service = PaLMService.fromMap(serviceMap);
        break;
      default:
        throw Exception('Unknown service type: $type');
    }
    return Character(
      id: map[SQFliteHelper.charactersColumnId] as String?,
      photoBLOB: map[SQFliteHelper.charactersColumnBotPhotoBLOB] as Uint8List,
      backgroundPhotoBLOB: map[SQFliteHelper.charactersColumnBotBackgroundPhotoBLOB] as Uint8List,
      botName: map[SQFliteHelper.charactersColumnBotName] as String,
      userName: map[SQFliteHelper.charactersColumnUserName] as String,
      firstMessage: map[SQFliteHelper.charactersColumnFirstMessage] as String,
      service: service,
    );
  }

  factory Character.emptyCharacter() { // used as Default Character Variable
    var uuid = const Uuid().v4();
    return Character(
      id: uuid,
      photoBLOB: Uint8List(0),
      backgroundPhotoBLOB: Uint8List(0),
      botName: "",
      userName: "",
      firstMessage: "",
      service: OpenAIService(
        characterId: uuid,
        modelName: OpenAIConstants.gpt3halfTurboName,
        temperature: 1,
        systemPrompt: "",
        characterPrompt: ""
      ),
    );
  }

  Map<String, dynamic> toShareableMap() { // should add more info about Service.
    return {
      SQFliteHelper.charactersColumnId: id,
      SQFliteHelper.charactersColumnBotName: botName,
      SQFliteHelper.charactersColumnUserName: userName,
      SQFliteHelper.charactersColumnFirstMessage: firstMessage,
      SQFliteHelper.charactersColumnService: service.toMap(),
      "photoUrl": photoUrl,
      "backgroundPhotoUrl": backgroundPhotoUrl
    };
  }

  static String encodeToShareableCode(Character character) {
    Map<String, dynamic> characterJson = character.toShareableMap();
    String jsonString = json.encode(characterJson);

    // Compress the data using gzip
    List<int> compressedData = gzip.encode(utf8.encode(jsonString));

    final secureKey = dotenv.get('CODE_SECURE_KEY');
    final keyBytes = sha256.convert(utf8.encode(secureKey)).bytes;
    final key = encrypt.Key(Uint8List.fromList(keyBytes));
    final iv = encrypt.IV.fromLength(16);
    final encryptor = encrypt.Encrypter(encrypt.AES(key));

    // Encrypt the compressed data
    final encryptedString = encryptor.encryptBytes(compressedData, iv: iv);
    String shareableCode = base64Url.encode(encryptedString.bytes);

    debugPrint('shareableCode length: ${shareableCode.length}');
    return shareableCode;
  }

  static Map<String, dynamic> decodeFromShareableCode(String shareableCode) {
    final secureKey = dotenv.get('CODE_SECURE_KEY');
    final keyBytes = sha256.convert(utf8.encode(secureKey)).bytes;
    final key = encrypt.Key(Uint8List.fromList(keyBytes));
    final iv = encrypt.IV.fromLength(16);
    final encryptor = encrypt.Encrypter(encrypt.AES(key));

    final decryptedBytes = base64Url.decode(shareableCode);
    final decryptedCompressedData = encryptor.decryptBytes(encrypt.Encrypted(decryptedBytes), iv: iv);

    // Decompress the data
    String decryptedString = utf8.decode(gzip.decode(decryptedCompressedData));

    Map<String, dynamic> characterJson = json.decode(decryptedString);
    return characterJson;
  }

  @override
  String toString() {
    return 'Character(id: $id, photoBLOB: ${photoBLOB.length}, backgroundPhotoBLOB: ${backgroundPhotoBLOB.length}, botName: $botName, userName: $userName, firstMessage: $firstMessage, service: $service, photoUrl: $photoUrl, backgroundPhotoUrl: $backgroundPhotoUrl)';
  }
}