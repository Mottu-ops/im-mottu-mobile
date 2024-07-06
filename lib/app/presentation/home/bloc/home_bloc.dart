import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mottu_marvel/app/core/utils/global_keys.dart';
import 'package:mottu_marvel/app/domain/entities/character_entity.dart';
import 'package:mottu_marvel/app/domain/usecases/get_characters.dart';
import 'package:mottu_marvel/app/core/error/failures.dart';
import 'package:mottu_marvel/app/core/theme/app_colors.dart';
import 'package:mottu_marvel/app/core/theme/text_syles.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCharacters getCharacters;

  HomeBloc({
    required this.getCharacters,
  }) : super(const HomeSuccess(characters: [])) {
    on<GetCharactersEvent>(
      (event, emit) async {
        final searchTerm = (state as HomeSuccess).searchTerm;

        emit((state as HomeSuccess).copyWith(isLoading: true));

        int page = event.page;

        final data = await getCharacters.call(
          GetCharactersParams(
            limit: 8,
            offset: page > 1 ? (page - 1) * 8 : 0,
            nameStartsWith: searchTerm,
          ),
        );

        data.fold((l) {
          if (l is ServerFailure) {
            rootScaffoldMessengerKey.currentState?.showSnackBar(
              SnackBar(
                backgroundColor: AppColors.primary,
                content: Row(
                  children: [
                    const Icon(Icons.error, color: AppColors.white),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Erro inesperado, por favor tente novamente',
                        style: TextStyles.h7Style.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
        }, (r) {
          emit(
            HomeSuccess(
              characters: r.results!.map((e) => e.toEntity()).toList(),
              maxPage: r.total! > 4 ? r.total! ~/ 4 : 1,
              atualPage: event.page,
              searchTerm: searchTerm,
            ),
          );
        });
      },
    );

    on<ChangeSearchTermEvent>((event, emit) async {
      emit((state as HomeSuccess).copyWith(searchTerm: event.value));
    });

    on<ToggleGridViewEvent>((event, emit) async {
      emit(
        (state as HomeSuccess)
            .copyWith(isGridView: !(state as HomeSuccess).isGridView),
      );
    });
  }
}
