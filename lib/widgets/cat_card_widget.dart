import 'package:fetching_data_with_cat_api/data/cat_card_model.dart';
import 'package:flutter/material.dart';

class CatCardWidget extends StatelessWidget {
  const CatCardWidget({super.key, required this.cat});
  final CatCardModel cat;

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        children: [
          Image.network(cat.url),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                cat.breed.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),
              Text(
                cat.breed.temperament,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text('Origin: ${cat.breed.origin}'),
              const SizedBox(height: 20),
              Text(cat.breed.description),
              const SizedBox(height: 20),
              Text(
                'average life span: ${cat.breed.lifeSpan}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ]);
  }
}
