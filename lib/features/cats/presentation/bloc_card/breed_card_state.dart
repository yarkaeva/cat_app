part of 'breed_card_bloc.dart';

abstract class BreedCardState extends Equatable {
  const BreedCardState();

  @override
  List<Object> get props => [];
}

class InitialState extends BreedCardState {}

class CardLoadInProgress extends BreedCardState {}

class CardLoadSuccess extends BreedCardState {
  final BreedCardEntity cat;
  const CardLoadSuccess(this.cat);
}

class CardLoadFailure extends BreedCardState {}
