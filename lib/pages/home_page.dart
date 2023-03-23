import 'package:flutter/material.dart';
import '../api/cat_list_api.dart';
import '../data/cat_list_item_model.dart';
import '../widgets/cat_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<CatListItemModel>> cats;

  @override
  void initState() {
    cats = fetchCatsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CATalog'),
      ),
      body: FutureBuilder(
        future: cats,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return CatListItem(cat: snapshot.data![index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator.adaptive();
        },
      ),
    );
  }
}
