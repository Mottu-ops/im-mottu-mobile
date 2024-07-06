part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class GetCharactersEvent extends HomeEvent {
  final int page;
  final String? name;

  const GetCharactersEvent({
    this.page = 1,
    this.name,
  });

  @override
  List<Object?> get props => [page, name];
}

class ChangeSearchTermEvent extends HomeEvent {
  final String value;

  const ChangeSearchTermEvent(this.value);

  @override
  List<Object> get props => [value];
}

class ToggleGridViewEvent extends HomeEvent {}
