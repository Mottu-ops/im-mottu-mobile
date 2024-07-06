part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeFailure extends HomeState {}

final class HomeSuccess extends HomeState {
  final int atualPage;
  final int? maxPage;
  final bool isLoading;
  final bool isGridView;
  final String? searchTerm;
  final List<CharacterEntity> characters;
  final List<CharacterEntity>? filteredCharacters;

  const HomeSuccess({
    this.atualPage = 1,
    this.maxPage,
    this.isLoading = false,
    this.isGridView = false,
    this.searchTerm,
    required this.characters,
    this.filteredCharacters,
  });

  HomeSuccess copyWith({
    int? atualPage,
    int? maxPage,
    bool? isLoading,
    bool? isGridView,
    String? searchTerm,
    List<CharacterEntity>? characters,
    List<CharacterEntity>? filteredCharacters,
  }) {
    return HomeSuccess(
      atualPage: atualPage ?? this.atualPage,
      maxPage: maxPage ?? this.maxPage,
      isLoading: isLoading ?? this.isLoading,
      isGridView: isGridView ?? this.isGridView,
      searchTerm: searchTerm ?? this.searchTerm,
      characters: characters ?? this.characters,
      filteredCharacters: filteredCharacters ?? this.filteredCharacters,
    );
  }

  @override
  List<Object?> get props => [
        atualPage,
        maxPage,
        isLoading,
        isGridView,
        searchTerm,
        characters,
        filteredCharacters,
      ];
}
