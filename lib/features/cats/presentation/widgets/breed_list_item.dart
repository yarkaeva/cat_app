import 'package:cat_app/features/cats/domain/entity/breed_list_item.dart';
import 'package:flutter/material.dart';

class CatListItem extends StatelessWidget {
  const CatListItem({super.key, required this.cat});
  final BreedListItem cat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/cat-page', arguments: cat.imageId);
      },
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cat.name,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 20),
            Text('Origin: ${cat.origin}'),
          ],
        ),
      ),
    );
  }
}
