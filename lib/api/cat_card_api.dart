import 'dart:convert';
import 'package:fetching_data_with_cat_api/data/cat_card_model.dart';
import 'package:http/http.dart' as http;

Future<CatCardModel> fetchCatInfo(String imageId) async {
  final response =
      await http.get(Uri.parse('https://api.thecatapi.com/v1/images/$imageId'));

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    final cat = CatCardModel.fromJson(json);
    return cat;
  } else if (response.statusCode == 500) {
    throw Exception('Server not responding');
  } else {
    throw Exception('Failed to load cat info');
  }
}
