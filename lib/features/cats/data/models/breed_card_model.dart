import 'package:cat_app/features/cats/data/models/breed_info.dart';
import 'package:cat_app/features/cats/domain/entity/breed_card.dart';

class BreedCardModel extends BreedCardEntity {
  BreedCardModel({
    required super.imageId,
    required super.url,
    required super.breed,
  });

  factory BreedCardModel.fromJson(Map<String, dynamic> json) => BreedCardModel(
        imageId: json['id'],
        url: json['url'],
        breed: (json['breeds'] as List<dynamic>)
            .map((e) => BreedInfoModel.fromJson(e as Map<String, dynamic>))
            .toList()
            .first,
      );
  BreedCardEntity toEntity() => BreedCardEntity(
        imageId: imageId,
        url: url,
        breed: breed,
      );
}
