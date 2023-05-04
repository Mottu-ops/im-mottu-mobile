import 'package:equatable/equatable.dart';
import 'package:marvel/core/enum/status_enum.dart';
import 'package:marvel/core/erros/failures.dart';
import 'package:marvel/domain/entities/characters/characters_entity.dart';

class CharactersState extends Equatable {
  final List<CharactersEntity>? list;
  final StatusEnum status;
  final Failure? failure;
  final String? message;

  const CharactersState({
    this.list,
    this.status = StatusEnum.initial,
    this.failure,
    this.message,
  });

  @override
  List<Object?> get props => [list, status, failure, message];

  CharactersState copyWith({
    List<CharactersEntity>? list,
    StatusEnum? status,
    Failure? failure,
    String? message,
  }) {
    return CharactersState(
      list: list ?? this.list,
      status: status ?? this.status,
      failure: failure ?? this.failure,
      message: message ?? this.message,
    );
  }
}
