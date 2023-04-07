import 'package:cat_app/features/cats/data/repository/cat_data_repository.dart';
import 'package:cat_app/features/cats/presentation/widgets/breed_card_widget.dart';
import 'package:flutter/material.dart';

class CatPage extends StatefulWidget {
  const CatPage({super.key});

  @override
  State<CatPage> createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  final CatRepositoryImpl _repo = CatRepositoryImpl();
  @override
  Widget build(BuildContext context) {
    final String imageId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('CATalog'),
      ),
      body: FutureBuilder(
        future: _repo.getCat(imageId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BreedCardWidget(
              cat: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
