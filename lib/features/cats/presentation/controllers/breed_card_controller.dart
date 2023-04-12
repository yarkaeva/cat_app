import 'package:cat_app/features/cats/data/repository/cat_data_repository.dart';
import 'package:cat_app/features/cats/domain/entity/breed_card.dart';

class BreedCardController {
  final CatRepositoryImpl _catRepoImpl = CatRepositoryImpl();

  String _imageId = '';
  String get imageId => _imageId;

  void setImageId(String id) {
    _imageId = id;
  }

  Future<BreedCard> loadCat() async {
    var cat = await _catRepoImpl.getCat(_imageId);
    return cat;
  }
}
