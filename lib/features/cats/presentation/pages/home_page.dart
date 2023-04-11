import 'package:cat_app/features/cats/presentation/controller/breed_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/breed_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CATalog'),
      ),
      body: Consumer<BreedListController>(
        builder: (context, controller, child) {
          if (controller.cats.isNotEmpty) {
            return ListView.separated(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              itemCount: controller.cats.length,
              itemBuilder: (context, index) {
                return CatListItem(cat: controller.cats[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator.adaptive(),
                  Text('Loading cats :3'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
