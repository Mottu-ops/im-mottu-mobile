import 'package:equatable/equatable.dart';
import 'package:mottu_marvel/app/domain/entities/comic_entity.dart';
import 'package:mottu_marvel/app/domain/entities/thumbnail_entity.dart';

class CharacterEntity extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? modified;
  final ThumbnailEntity? thumbnail;
  final String? resourceURI;
  final ComicEntity? series;
  final ComicEntity? events;

  const CharacterEntity({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.thumbnail,
    this.resourceURI,
    this.series,
    this.events,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        modified,
        thumbnail,
        resourceURI,
        series,
        events,
      ];
}
