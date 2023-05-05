import 'package:cat_app/features/cats/domain/entity/breed_info.dart';

class BreedCardEntity {
  BreedCardEntity({
    required this.imageId,
    required this.url,
    required this.breed,
  });

  final String imageId;
  final String url;
  final BreedInfo breed;
}
