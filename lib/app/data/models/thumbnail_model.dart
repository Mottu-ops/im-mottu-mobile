import 'package:equatable/equatable.dart';
import 'package:mottu_marvel/app/domain/entities/thumbnail_entity.dart';

class ThumbnailModel extends Equatable {
  final String? path;
  final String? extension;

  const ThumbnailModel({this.path, this.extension});

  ThumbnailEntity toEntity() => ThumbnailEntity(
        path: path,
        extension: extension,
      );

  ThumbnailModel fromJson(Map<String, dynamic> json) {
    return ThumbnailModel(
      path: json['path'],
      extension: json['extension'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['path'] = path;
    data['extension'] = extension;
    return data;
  }

  @override
  List<Object?> get props => [path, extension];
}
