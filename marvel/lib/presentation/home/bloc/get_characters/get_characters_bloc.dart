import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marvel/core/enum/sorting_types.dart';
import 'package:marvel/core/enum/status_enum.dart';
import 'package:marvel/domain/usecases/characters/get_list_characters.dart';
import 'package:marvel/presentation/home/bloc/get_characters/get_characters.dart';

@injectable
class GetListCharactersBloc extends Bloc<GetCharactersEvent, CharactersState> {
  final GetListCharactersUsecase _getListCharacters;

  GetListCharactersBloc({
    required GetListCharactersUsecase getListCharacters,
  })  : _getListCharacters = getListCharacters,
        super(const CharactersState()) {
    on<GetListCharacters>(_getList);
  }

  Future<void> _getList(
    GetListCharacters event,
    Emitter<CharactersState> emit,
  ) async {
    emit(state.copyWith(status: StatusEnum.loading));

    final failureOrSuccess = await _getListCharacters.call(Params(
      orderBy: event.orderBy != null
          ? event.orderBy!.type
          : SortingTypes.nameAscending.type,
      
    ));

    emit(
      failureOrSuccess.fold(
        (failure) => state.copyWith(
          status: StatusEnum.failure,
          failure: failure,
        ),
        (response) {
          final responseIsNotEmpty = response.isNotEmpty;

          return state.copyWith(
            status: responseIsNotEmpty ? StatusEnum.success : StatusEnum.empty,
            list: response,
            message: responseIsNotEmpty ? '' : 'Vazio',
          );
        },
      ),
    );
  }
}
