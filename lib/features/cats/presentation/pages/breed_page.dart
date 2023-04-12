import 'package:cat_app/features/cats/presentation/controllers/breed_card_controller.dart';
import 'package:cat_app/features/cats/presentation/widgets/breed_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CATalog'),
      ),
      body: FutureBuilder(
        future: Provider.of<BreedCardController>(context).loadCat(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BreedCardWidget(
              cat: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
