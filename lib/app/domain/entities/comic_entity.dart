import 'package:equatable/equatable.dart';

class ComicEntity extends Equatable {
  final int? available;
  final String? collectionURI;
  final List<ComicItemEntity>? items;
  final int? returned;

  const ComicEntity({
    this.available,
    this.collectionURI,
    this.items,
    this.returned,
  });

  @override
  List<Object?> get props => [available, collectionURI, items, returned];
}

class ComicItemEntity extends Equatable {
  final String? resourceURI;
  final String? name;

  const ComicItemEntity({this.resourceURI, this.name});

  @override
  List<Object?> get props => [resourceURI, name];
}
