import 'package:cat_app/features/cats/data/api/cat_api.dart';
import 'package:cat_app/features/cats/domain/entity/breed_card.dart';
import 'package:cat_app/features/cats/domain/entity/breed_list_item.dart';
import 'package:cat_app/features/cats/domain/repository/cat_repository.dart';

class CatRepositoryImpl extends CatRepository {
  @override
  Future<BreedCard> getCat(String imageId) async {
    var cat = await fetchCatInfo(imageId);
    return cat.toEntity();
  }

  @override
  Future<List<BreedListItem>> getCatsList() async {
    var cats = await fetchCatsList().then(
      (list) => list.map((cat) => cat.toEntity()).toList(),
    );
    return cats;
  }
}
