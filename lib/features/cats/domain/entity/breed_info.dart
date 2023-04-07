class BreedInfo {
  BreedInfo({
    required this.id,
    required this.name,
    required this.temperament,
    required this.origin,
    required this.description,
    required this.lifeSpan,
    required this.wikipediaUrl,
  });

  final String id;
  final String name;
  final String temperament;
  final String origin;
  final String description;
  final String lifeSpan;
  final String? wikipediaUrl;
}
