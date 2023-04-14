import 'package:cat_app/features/cats/domain/entity/breed_info.dart';

class BreedInfoModel extends BreedInfo {
  BreedInfoModel({
    required super.id,
    required super.name,
    required super.temperament,
    required super.origin,
    required super.description,
    required super.lifeSpan,
    required super.wikipediaUrl,
  });

  factory BreedInfoModel.fromJson(Map<String, dynamic> json) => BreedInfoModel(
        id: json['id'],
        name: json['name'],
        temperament: json['temperament'],
        origin: json['origin'],
        description: json['description'],
        lifeSpan: json['life_span'],
        wikipediaUrl: json['wikipedia_url'],
      );

  
}
