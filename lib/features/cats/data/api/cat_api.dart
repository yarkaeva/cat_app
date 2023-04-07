import 'dart:convert';
import 'package:cat_app/features/cats/data/models/breed_list_item_model.dart';
import 'package:cat_app/features/cats/data/models/breed_card_model.dart';
import 'package:http/http.dart' as http;

class ApiConfig {
  static const baseUrl = 'https://api.thecatapi.com/v1/';
}

Future<List<BreedListItemModel>> fetchCatsList() async {
  final response = await http.get(Uri.parse('${ApiConfig.baseUrl}breeds'));

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as List<dynamic>;
    final cats = json
        .map((e) => BreedListItemModel.fromJson(e as Map<String, dynamic>))
        .toList();
    return cats;
  } else if (response.statusCode == 500) {
    throw Exception('Server not responding');
  } else {
    throw Exception('Failed to load cat info');
  }
}

Future<BreedCardModel> fetchCatInfo(String imageId) async {
  final response =
      await http.get(Uri.parse('${ApiConfig.baseUrl}images/$imageId'));

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    final cat = BreedCardModel.fromJson(json);
    return cat;
  } else if (response.statusCode == 500) {
    throw Exception('Server not responding');
  } else {
    throw Exception('Failed to load cat info');
  }
}
