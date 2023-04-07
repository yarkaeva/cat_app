import 'package:cat_app/features/cats/domain/entity/breed_card.dart';
import 'package:flutter/material.dart';

class BreedCardWidget extends StatelessWidget {
  const BreedCardWidget({super.key, required this.cat});
  final BreedCard cat;

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
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
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cat-page-wiki',
                        arguments: cat.breed.wikipediaUrl);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('See on Wiki'),
                      Icon(Icons.search),
                    ],
                  ))
            ],
          ),
        ]);
  }
}
