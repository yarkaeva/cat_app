part of 'breed_list_bloc.dart';

abstract class BreedListState {
  const BreedListState();
}

class ListLoadInProgress extends BreedListState {}

class ListLoadSuccess extends BreedListState {
  final List<BreedListItem> cats;
  const ListLoadSuccess(this.cats);
}

class ListLoadFailure extends BreedListState {}
