import 'package:dart_openai/dart_openai.dart';

class OpenAIRepository {

  OpenAIRepository();

  Future<Stream<OpenAIStreamChatCompletionModel>> requestChatStream(
      String key,
      String modelName,
      List<OpenAIChatCompletionChoiceMessageModel> messages,
      double temperature
      ) async {
    OpenAI.apiKey = key;
    return OpenAI.instance.chat.createStream(
      model: modelName,
      messages: messages,
      temperature: temperature
    );
  }

}