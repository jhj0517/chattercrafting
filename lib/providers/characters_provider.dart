import 'package:flutter/material.dart';

import '../models/models.dart';
import '../repositories/characters_repository.dart';


enum ExportStatus{
  initialized,
  loading,
  complete,
  failed
}

enum ImportStatus{
  initialized,
  loading,
  complete,
  failed
}

class CharactersProvider extends ChangeNotifier {

  final CharactersRepository charactersRepository;

  List<Character> _characters=[];
  List<Character> get characters => _characters;

  //These will be used in ChatPage
  Character _currentCharacter = Character.emptyCharacter();
  Character get currentCharacter => _currentCharacter;

  ExportStatus exportStatus = ExportStatus.initialized;
  ImportStatus importStatus = ImportStatus.initialized;
  String shareableCode = "";
  Character importedCharacter = Character.emptyCharacter();

  CharactersProvider({required this.charactersRepository}) {
    //Initialize something
    updateCharacters();
  }

  Future<void> updateCharacters() async{
    _characters = await charactersRepository.getCharacters();
    notifyListeners();
  }

  Future<void> updateCurrentCharacter(String characterId) async {
    _currentCharacter = await charactersRepository.getOneCharacter(characterId);
    notifyListeners();
  }

  Future<void> insertOrUpdateCharacter(Character character) async{
     await charactersRepository.insertOrUpdateCharacter(character);
     await updateCharacters();
  }

  Future<void> insertFirstMessage(Character character, ChatMessage firstMessage) async{
    await charactersRepository.insertFirstMessage(character, firstMessage);
    await updateCharacters();
  }

  Future<void> deleteCharacter(String characterId) async{
    await charactersRepository.deleteCharacter(characterId);
    await updateCharacters();
  }

}
