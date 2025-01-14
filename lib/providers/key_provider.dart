import 'dart:io';
import 'package:flutter/material.dart';

import '../repositories/key_repository.dart';
import '../constants/secure_storage_constants.dart';

class KeyProvider extends ChangeNotifier {

  KeyProvider({required this.keyRepository}){

  }

  final KeyRepository keyRepository;

  String? _openAPIKey;
  String? get openAPIKey => _openAPIKey;

  String? _paLMAPIKey;
  String? get paLMAPIKey => _paLMAPIKey;

  Future<void> initKeys() async {
    _openAPIKey = await keyRepository.readValue(SecureStorageConstants.keyOpenAI);
    _paLMAPIKey = await keyRepository.readValue(SecureStorageConstants.keyPaLM);
  }

  Future<void> saveKey(String key,String value) async {
    await keyRepository.writeValue(key, value);
    initKeys();
  }

}