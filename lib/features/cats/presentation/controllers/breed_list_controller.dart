import 'package:cat_app/features/cats/data/repository/cat_data_repository.dart';
import 'package:cat_app/features/cats/domain/entity/breed_list_item.dart';

class BreedListController {
  final CatRepositoryImpl _catRepoImpl = CatRepositoryImpl();

  List<BreedListItem> _cats = [];
  List<BreedListItem> get cats => _cats;

  Future<List<BreedListItem>> loadCatsList() async {
    _cats = await _catRepoImpl.getCatsList();
    return _cats;
  }
}
