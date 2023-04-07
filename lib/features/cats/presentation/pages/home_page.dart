import 'package:cat_app/features/cats/data/repository/cat_data_repository.dart';
import 'package:flutter/material.dart';
import '../widgets/breed_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CatRepositoryImpl _repo = CatRepositoryImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CATalog'),
      ),
      body: FutureBuilder(
        future: _repo.getCatsList(),
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
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
