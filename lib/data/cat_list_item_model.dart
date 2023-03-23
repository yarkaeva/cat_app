class CatListItemModel {
  CatListItemModel({
    required this.id,
    required this.name,
    required this.origin,
    required this.imageId,
  });

  final String id;
  final String name;
  final String origin;
  final String? imageId;

  factory CatListItemModel.fromJson(Map<String, dynamic> json) =>
      CatListItemModel(
        id: json['id'],
        name: json['name'],
        origin: json['origin'],
        imageId: json['reference_image_id'],
      );
}
