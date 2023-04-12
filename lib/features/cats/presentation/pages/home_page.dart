import 'package:cat_app/features/cats/domain/entity/breed_list_item.dart';
import 'package:cat_app/features/cats/presentation/controllers/breed_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cat_app/features/cats/presentation/widgets/breed_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CATalog'),
      ),
      body: FutureProvider<List<BreedListItem>>(
        initialData: BreedListController().cats,
        create: (context) => BreedListController().loadCatsList(),
        child: Consumer<List<BreedListItem>>(
          builder: (context, controller, child) {
            if (controller.isNotEmpty) {
              return ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                itemCount: controller.length,
                itemBuilder: (context, index) {
                  return CatListItem(cat: controller[index]);
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
      ),
    );
  }
}
