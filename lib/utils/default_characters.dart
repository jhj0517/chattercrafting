import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../models/models.dart';
import '../constants/app_constants.dart';
import '../utils/image_compresser.dart';

Future<List<Character>> getDefaultCharacters(String userName) async {
  final femalePhotoBase64 = await convertAssetImageToBLOB(AppConstants.assetFemale1);
  final femaleBackgroundPhotoBase64 = await convertAssetImageToBLOB(AppConstants.assetFemale1Background);
  final malePhotoBase64 = await convertAssetImageToBLOB(AppConstants.assetMale1);
  final maleBackgroundPhotoBase64 = await convertAssetImageToBLOB(AppConstants.assetMale1Background);
  final chatGPTPhotoBase64 = await convertAssetImageToBLOB(AppConstants.assetChatGPTProfilePicture);
  final chatGPTBackgroundPhotoBase64 = await convertAssetImageToBLOB(AppConstants.assetGreyBackground);
  const uuid = Uuid();
  final femaleCharacterId = uuid.v4();
  final maleCharacterId = uuid.v4();
  final chatGPTCharacterId = uuid.v4();

  final Character defaultFemaleCharacter = Character(
    id: femaleCharacterId,
    photoBLOB: femalePhotoBase64,
    backgroundPhotoBLOB: femaleBackgroundPhotoBase64,
    botName: Intl.message("defaultCharacterGirlName"),
    userName: userName,
    firstMessage: Intl.message("defaultCharacterGirlFirstMessage"),
    service: OpenAIService(
      characterId: femaleCharacterId,
      modelName: OpenAIService.openAIModels.first,
      temperature: 1,
      characterPrompt: Intl.message("defaultCharacterBoyDescription"),
      systemPrompt: Intl.message("defaultCharacterSystemPrompt"),
    )
  );

  final Character defaultMaleCharacter = Character(
    id: maleCharacterId,
    photoBLOB: malePhotoBase64,
    backgroundPhotoBLOB: maleBackgroundPhotoBase64,
    botName: Intl.message("defaultCharacterBoyName"),
    userName: userName,
    firstMessage: "",
    service: OpenAIService(
      characterId: maleCharacterId,
      modelName: OpenAIService.openAIModels.first,
      temperature: 1,
      characterPrompt: Intl.message("defaultCharacterBoyDescription"),
      systemPrompt: Intl.message("defaultCharacterSystemPrompt")
    )
  );

  final Character chatGPTCharacter = Character(
      id: chatGPTCharacterId,
      photoBLOB: chatGPTPhotoBase64,
      backgroundPhotoBLOB: chatGPTBackgroundPhotoBase64,
      botName: Intl.message("chatGPTDefaultCharacterName"),
      userName: userName,
      firstMessage: "",
      service: OpenAIService(
          characterId: maleCharacterId,
          modelName: OpenAIService.openAIModels.first,
          temperature: 1,
          characterPrompt: "",
          systemPrompt: ""
      )
  );

  return [defaultFemaleCharacter, defaultMaleCharacter, chatGPTCharacter];
}