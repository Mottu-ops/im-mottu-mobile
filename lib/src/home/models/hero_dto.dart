// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'hero_dto.freezed.dart';

@freezed
class HeroDto with _$HeroDto {
  const HeroDto._();

  factory HeroDto({
    int? id,
    String? name,
    String? description,
    @JsonKey(
      includeFromJson: false,
      includeToJson: true,
      fromJson: HeroDto.fromJson,
    )
    String? image,
  }) = _HeroDto;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image': image,
      };

  factory HeroDto.fromJson(Map<String, dynamic> json) {
    final thumbnail = json['thumbnail'] as Map<String, dynamic>?;
    final imagePath = thumbnail != null ? '${thumbnail['path']}.${thumbnail['extension']}' : null;

    return HeroDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] ?? imagePath,
    );
  }
}
