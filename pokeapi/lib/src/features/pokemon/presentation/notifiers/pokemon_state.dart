part of 'pokemon_notifier.dart';

class PokemonState extends Equatable {
  final List<PokemonEntity> pokemons;
  final PokemonStatus status;

  const PokemonState({
    this.pokemons = const [],
    this.status = PokemonStatus.initial,
  });

  @override
  List<Object?> get props => [pokemons, status];

  PokemonState copyWith({
    List<PokemonEntity>? pokemons,
    PokemonStatus? status,
  }) {
    return PokemonState(
      pokemons: pokemons ?? this.pokemons,
      status: status ?? this.status,
    );
  }
}

enum PokemonStatus { initial, loading, loaded, error }
