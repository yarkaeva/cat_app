part of 'breed_card_bloc.dart';

abstract class BreedCardState extends Equatable {
  const BreedCardState();

  @override
  List<Object> get props => [];
}

class CardLoadInProgress extends BreedCardState {}

class CardLoadSuccess extends BreedCardState {
  final BreedCard cat;
  const CardLoadSuccess(this.cat);
}

class CardLoadFailure extends BreedCardState {}
