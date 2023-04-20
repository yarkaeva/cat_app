part of 'breed_card_bloc.dart';

abstract class BreedCardEvent {
  const BreedCardEvent();
}

class CardLoadRequested extends BreedCardEvent {
  final String imageId;
  const CardLoadRequested(this.imageId);
}
