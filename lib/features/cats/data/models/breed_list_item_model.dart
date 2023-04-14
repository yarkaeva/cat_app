import 'package:cat_app/features/cats/domain/entity/breed_list_item.dart';

class BreedListItemModel extends BreedListItem {
  BreedListItemModel({
    required super.id,
    required super.name,
    required super.origin,
    required super.imageId,
  });

  factory BreedListItemModel.fromJson(Map<String, dynamic> json) =>
      BreedListItemModel(
        id: json['id'],
        name: json['name'],
        origin: json['origin'],
        imageId: json['reference_image_id'],
      );
  BreedListItem toEntity() => BreedListItem(
        id: id,
        name: name,
        origin: origin,
        imageId: imageId,
      );
}
