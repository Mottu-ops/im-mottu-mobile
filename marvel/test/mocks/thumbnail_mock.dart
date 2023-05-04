import 'package:marvel/data/models/characters/characters.dart';
import 'package:marvel/domain/domain.dart';

class ThumbnailMock {
  static ThumbnailModel get thumbnailModel => const ThumbnailModel(
        path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
        extension: 'jpg',
      );

  static ThumbnailEntity get thumbnailEntity => ThumbnailEntity(
        path: thumbnailModel.path,
        extension: thumbnailModel.extension,
      );
}
