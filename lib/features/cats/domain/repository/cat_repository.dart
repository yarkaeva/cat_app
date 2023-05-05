import 'package:cat_app/features/cats/domain/entity/breed_card.dart';
import 'package:cat_app/features/cats/domain/entity/breed_list_item.dart';

abstract class CatRepository {
  ///Get one cat from Api.
  Future<BreedCardEntity> getCat(String imageId);

  ///Get list of cats from Api.
  Future<List<BreedListItemEntity>> getCatsList();
}
