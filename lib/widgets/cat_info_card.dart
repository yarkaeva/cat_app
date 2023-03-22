import 'package:fetching_data_with_cat_api/data/cat_model.dart';
import 'package:flutter/material.dart';

class CatInfoCard extends StatelessWidget {
  const CatInfoCard({super.key, required this.cat});
  final Cat cat;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withOpacity(0.2),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Breed Name: ${cat.name}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          Text(cat.temperament),
          Text('Origin: ${cat.origin}'),
          const SizedBox(height: 20),
          Text(cat.description),
          Text('average life span: ${cat.lifeSpan}'),
        ],
      ),
    );
  }
}
