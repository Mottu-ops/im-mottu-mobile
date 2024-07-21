import '../models/result_character.dart';

enum HomeStateStatus {
  loading,
  success,
  error;
}

class HomeState {
  final HomeStateStatus status;

  final String errorMessage;
  final List<ResultCharacter> charactersList;
  HomeState({
    required this.status,
    required this.errorMessage,
    required this.charactersList,
  });

  static HomeState empty() => HomeState(status: HomeStateStatus.loading, errorMessage: '', charactersList: []);

  HomeState copyWith({
    HomeStateStatus? status,
    String? errorMessage,
    List<ResultCharacter>? charactersList,
  }) {
    return HomeState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      charactersList: charactersList ?? this.charactersList,
    );
  }
}
