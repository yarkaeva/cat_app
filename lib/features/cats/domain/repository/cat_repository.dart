import 'package:cat_app/features/cats/domain/entity/breed_card.dart';
import 'package:cat_app/features/cats/domain/entity/breed_list_item.dart';

abstract class CatRepository {
  ///Get one cat from Api.
  Future<BreedCard> getCat(String imageId);

  ///Get list of cats from Api.
  Future<List<BreedListItem>> getCatsList();
}
