import 'package:cat_app/features/cats/data/models/breed_info.dart';
import 'package:cat_app/features/cats/domain/entity/breed_card.dart';

class BreedCardModel {
  BreedCardModel({
    required this.imageId,
    required this.url,
    required this.breed,
  });

  final String imageId;
  final String url;
  final BreedInfoModel breed;

  factory BreedCardModel.fromJson(Map<String, dynamic> json) => BreedCardModel(
        imageId: json['id'],
        url: json['url'],
        breed: (json['breeds'] as List<dynamic>)
            .map((e) => BreedInfoModel.fromJson(e as Map<String, dynamic>))
            .toList()
            .first,
      );
  BreedCard toEntity() => BreedCard(
        imageId: imageId,
        url: url,
        breed: breed.toEntity(),
      );
}
