part of 'breed_list_bloc.dart';

abstract class BreedListState extends Equatable {
  @override
  List<Object> get props => [];

  const BreedListState();
}

class InitialState extends BreedListState {}

class ListLoadInProgress extends BreedListState {}

class ListLoadSuccess extends BreedListState {
  final List<BreedListItemEntity> cats;
  @override
  List<Object> get props => [cats];
  const ListLoadSuccess(this.cats);
}

class ListLoadFailure extends BreedListState {}
