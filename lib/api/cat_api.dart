import 'dart:convert';

import 'package:fetching_data_with_cat_api/data/cat_model.dart';
import 'package:http/http.dart' as http;

Future<List<Cat>> fetchCat() async {
  final response =
      await http.get(Uri.parse('https://api.thecatapi.com/v1/breeds'));

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as List<dynamic>;
    final cats =
        json.map((e) => Cat.fromJson(e as Map<String, dynamic>)).toList();
    return cats;
  } else if (response.statusCode == 500) {
    throw Exception('Server not responding');
  } else {
    throw Exception('Failed to load cat info');
  }
}
