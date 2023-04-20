import 'package:cat_app/features/cats/presentation/bloc_list/breed_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_app/features/cats/presentation/widgets/breed_list_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CATalog'),
      ),
      body: BlocBuilder<BreedListBloc, BreedListState>(
        builder: (context, state) {
          if (state is ListLoadInProgress) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator.adaptive(),
                  Text('Loading cats :3'),
                ],
              ),
            );
          } else if (state is ListLoadSuccess) {
            return ListView.separated(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              itemCount: state.cats.length,
              itemBuilder: (context, index) {
                return CatListItem(cat: state.cats[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
            );
          } else if (state is ListLoadFailure) {
            return const Center(child: Text('Can`t download cats 3:'));
          } else {
            return const Center(
                child: Text('Can`t define whats going wrong?!'));
          }
        },
      ),
    );
  }
}
