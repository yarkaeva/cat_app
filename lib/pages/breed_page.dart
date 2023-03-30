import 'package:fetching_data_with_cat_api/api/cat_api.dart';
import 'package:fetching_data_with_cat_api/widgets/breed_card_widget.dart';
import 'package:flutter/material.dart';

class CatPage extends StatefulWidget {
  const CatPage({super.key});

  @override
  State<CatPage> createState() => _CatPageState();
}

class _CatPageState extends State<CatPage> {
  @override
  Widget build(BuildContext context) {
    final String imageId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('CATalog'),
      ),
      body: FutureBuilder(
        future: fetchCatInfo(imageId),
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
