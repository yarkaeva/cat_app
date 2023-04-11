import 'package:cat_app/features/cats/data/repository/cat_data_repository.dart';
import 'package:cat_app/features/cats/domain/entity/breed_list_item.dart';
import 'package:flutter/material.dart';

class BreedListController extends ChangeNotifier {
  final CatRepositoryImpl _catRepoImpl = CatRepositoryImpl();

  BreedListController() {
    loadCatsList();
  }

  List<BreedListItem> _cats = [];
  List<BreedListItem> get cats => _cats;

  Future<void> loadCatsList() async {
    _cats = await _catRepoImpl.getCatsList();
    notifyListeners();
  }
}
