import 'package:bloc/bloc.dart';
import 'package:cat_app/features/cats/domain/entity/breed_card.dart';
import 'package:cat_app/features/cats/domain/repository/cat_repository.dart';
import 'package:equatable/equatable.dart';

part 'breed_card_event.dart';
part 'breed_card_state.dart';

class BreedCardBloc extends Bloc<BreedCardEvent, BreedCardState> {
  final CatRepository _repository;
  BreedCardBloc(CatRepository repository)
      : _repository = repository,
        super(CardLoadInProgress()) {
    on<CardLoadRequested>(_onCardLoadRequested);
  }

  Future<void> _onCardLoadRequested(
      CardLoadRequested event, Emitter<BreedCardState> emit) async {
    try {
      final cat = await _repository.getCat(event.imageId);
      emit(CardLoadSuccess(cat));
    } catch (_) {
      emit(CardLoadFailure());
    }
  }
}
