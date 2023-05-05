import 'package:bloc/bloc.dart';
import 'package:cat_app/features/cats/domain/entity/breed_list_item.dart';
import 'package:cat_app/features/cats/domain/repository/cat_repository.dart';
import 'package:equatable/equatable.dart';

part 'breed_list_event.dart';
part 'breed_list_state.dart';

class BreedListBloc extends Bloc<BreedListEvent, BreedListState> {
  final CatRepository _repository;
  BreedListBloc(CatRepository repository)
      : _repository = repository,
        super(InitialState()) {
    on<LoadList>(_onLoadList);
  }

  Future<void> _onLoadList(LoadList event, Emitter<BreedListState> emit) async {
    try {
      emit(ListLoadInProgress());
      final cats = await _repository.getCatsList();
      return emit(ListLoadSuccess(cats));
    } catch (_) {
      return emit(ListLoadFailure());
    }
  }
}
