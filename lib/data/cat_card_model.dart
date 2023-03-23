import 'package:fetching_data_with_cat_api/data/breed_info.dart';

class CatCardModel {
  CatCardModel({
    required this.imageId,
    required this.url,
    required this.breed,
  });

  final String imageId;
  final String url;
  final BreedInfo breed;

  factory CatCardModel.fromJson(Map<String, dynamic> json) => CatCardModel(
        imageId: json['id'],
        url: json['url'],
        breed: (json['breeds'] as List<dynamic>)
            .map((e) => BreedInfo.fromJson(e as Map<String, dynamic>))
            .toList()
            .first,
      );
}
