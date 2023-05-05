part of 'breed_card_bloc.dart';

abstract class BreedCardEvent {
  const BreedCardEvent();
}

class LoadCard extends BreedCardEvent {
  final String imageId;
  const LoadCard(this.imageId);
}
