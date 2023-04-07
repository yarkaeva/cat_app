import 'package:cat_app/features/cats/domain/entity/breed_info.dart';

class BreedInfoModel {
  BreedInfoModel({
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

  factory BreedInfoModel.fromJson(Map<String, dynamic> json) => BreedInfoModel(
        id: json['id'],
        name: json['name'],
        temperament: json['temperament'],
        origin: json['origin'],
        description: json['description'],
        lifeSpan: json['life_span'],
        wikipediaUrl: json['wikipedia_url'],
      );

  BreedInfo toEntity() => BreedInfo(
        id: id,
        name: name,
        temperament: temperament,
        origin: origin,
        description: description,
        lifeSpan: lifeSpan,
        wikipediaUrl: wikipediaUrl,
      );
}
