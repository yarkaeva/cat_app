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
        super(InitialState()) {
    on<LoadCard>(_onLoadCard);
  }

  Future<void> _onLoadCard(LoadCard event, Emitter<BreedCardState> emit) async {
    try {
      emit(CardLoadInProgress());
      final cat = await _repository.getCat(event.imageId);
      emit(CardLoadSuccess(cat));
    } catch (_) {
      emit(CardLoadFailure());
    }
  }
}
