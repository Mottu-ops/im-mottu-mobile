import 'package:equatable/equatable.dart';

class ThumbnailEntity extends Equatable {
  final String? path;
  final String? extension;

  String get url => '$path.$extension';

  const ThumbnailEntity({
    this.path,
    this.extension,
  });

  @override
  List<Object?> get props => [path, extension];
}
