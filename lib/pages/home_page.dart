import 'package:flutter/material.dart';
import '../api/cat_api.dart';
import '../widgets/cat_info_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cats = fetchCat();

  @override
  void initState() {
    fetchCat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CATalog'),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        itemCount: 10,
        itemBuilder: (context, index) {
          return FutureBuilder(
            future: cats,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return CatInfoCard(cat: snapshot.data![index]);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}
