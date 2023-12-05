import 'dart:convert';

import '../../localdb/localdb.dart';
import '../../constants/openai_constants.dart';
import 'i_service.dart';


class OpenAIService implements IService {

  static const openAIModels = [OpenAIConstants.gpt3halfTurboName, OpenAIConstants.gpt4Name];
  static const openAIModelNameMapping = {
    OpenAIConstants.gpt3halfTurboName : OpenAIConstants.gpt3halfTurboId,
    OpenAIConstants.gpt4Name : OpenAIConstants.gpt4Id,
    OpenAIConstants.gpt432kName : OpenAIConstants.gpt432kId
  };

  @override
  final ServiceType type = ServiceType.openAI;
  @override
  final String characterId;

  final int? id;
  final String modelName;
  final String? modelId;
  final double temperature;
  final String systemPrompt;
  final String characterPrompt;

  OpenAIService({
    this.id,
    required this.characterId,
    required this.modelName,
    required this.temperature,
    required this.systemPrompt,
    required this.characterPrompt,
  }) : modelId = openAIModelNameMapping[modelName];

  @override
  Map<String, dynamic> toMap() {
    return {
      SQFliteHelper.openAIColumnServiceType: type.index,
      SQFliteHelper.openAIColumnCharacterId: characterId,
      SQFliteHelper.openAIColumnModelName: modelName,
      SQFliteHelper.openAIColumnModelId: modelId,
      SQFliteHelper.openAIColumnTemperature: temperature,
      SQFliteHelper.openAIColumnSystemPrompt: systemPrompt,
      SQFliteHelper.openAIColumnCharacterPrompt: characterPrompt,
    };
  }

  factory OpenAIService.fromMap(Map<String, dynamic> map) {
    return OpenAIService(
        id: map[SQFliteHelper.openAIColumnId] as int?, // This is always null until I make local db table
        characterId: map[SQFliteHelper.openAIColumnCharacterId] as String,
        modelName: map[SQFliteHelper.openAIColumnModelName] as String,
        temperature: map[SQFliteHelper.openAIColumnTemperature] as double,
        systemPrompt: map[SQFliteHelper.openAIColumnSystemPrompt] as String,
        characterPrompt: map[SQFliteHelper.openAIColumnCharacterPrompt] as String,
    );
  }
}