import 'package:cat_app/features/cats/data/repository/cat_data_repository.dart';
import 'package:cat_app/features/cats/presentation/bloc_card/breed_card_bloc.dart';
import 'package:cat_app/features/cats/presentation/widgets/breed_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String imageId = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('CATalog'),
      ),
      body: BlocProvider<BreedCardBloc>(
        create: (context) =>
            BreedCardBloc(CatRepositoryImpl())..add(LoadCard(imageId)),
        child: BlocBuilder<BreedCardBloc, BreedCardState>(
          builder: (context, state) {
            if (state is CardLoadInProgress) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator.adaptive(),
                    Text('Loading cat :3'),
                  ],
                ),
              );
            } else if (state is CardLoadSuccess) {
              return BreedCardWidget(
                cat: state.cat,
              );
            } else if (state is CardLoadFailure) {
              return const Center(child: Text('Can`t find cat 3:'));
            } else {
              return const SizedBox(
                height: 10,
              );
            }
          },
        ),
      ),
    );
  }
}
