import 'package:equatable/equatable.dart';
import 'package:marvel/core/enum/sorting_types.dart';

abstract class GetCharactersEvent extends Equatable {
  const GetCharactersEvent();

  @override
  List<Object> get props => [];
}

class GetListCharacters extends GetCharactersEvent {
  const GetListCharacters({
    this.orderBy,
  });

  final SortingTypes? orderBy;

  @override
  List<Object> get props => [orderBy!];
}
