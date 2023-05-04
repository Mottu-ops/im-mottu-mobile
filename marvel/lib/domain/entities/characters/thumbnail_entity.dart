import 'package:equatable/equatable.dart';

class ThumbnailEntity extends Equatable {
  const ThumbnailEntity({
    required this.path,
    required this.extension,
  });

  final String path;
  final String extension;

  @override
  List<Object?> get props => [path, extension];
}
