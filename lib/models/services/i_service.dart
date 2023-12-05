enum ServiceType {
  openAI,
  paLM
}
abstract class IService {
  final ServiceType type;
  final String characterId;

  IService({
    required this.type,
    required this.characterId,
  });

  Map<String, dynamic> toMap();
}