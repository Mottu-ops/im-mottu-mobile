// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'hero_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HeroDto {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: false, includeToJson: true, fromJson: HeroDto.fromJson)
  String? get image => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HeroDtoCopyWith<HeroDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeroDtoCopyWith<$Res> {
  factory $HeroDtoCopyWith(HeroDto value, $Res Function(HeroDto) then) =
      _$HeroDtoCopyWithImpl<$Res, HeroDto>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      @JsonKey(
          includeFromJson: false,
          includeToJson: true,
          fromJson: HeroDto.fromJson)
      String? image});
}

/// @nodoc
class _$HeroDtoCopyWithImpl<$Res, $Val extends HeroDto>
    implements $HeroDtoCopyWith<$Res> {
  _$HeroDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HeroDtoImplCopyWith<$Res> implements $HeroDtoCopyWith<$Res> {
  factory _$$HeroDtoImplCopyWith(
          _$HeroDtoImpl value, $Res Function(_$HeroDtoImpl) then) =
      __$$HeroDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? description,
      @JsonKey(
          includeFromJson: false,
          includeToJson: true,
          fromJson: HeroDto.fromJson)
      String? image});
}

/// @nodoc
class __$$HeroDtoImplCopyWithImpl<$Res>
    extends _$HeroDtoCopyWithImpl<$Res, _$HeroDtoImpl>
    implements _$$HeroDtoImplCopyWith<$Res> {
  __$$HeroDtoImplCopyWithImpl(
      _$HeroDtoImpl _value, $Res Function(_$HeroDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? image = freezed,
  }) {
    return _then(_$HeroDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HeroDtoImpl extends _HeroDto {
  _$HeroDtoImpl(
      {this.id,
      this.name,
      this.description,
      @JsonKey(
          includeFromJson: false,
          includeToJson: true,
          fromJson: HeroDto.fromJson)
      this.image})
      : super._();

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  @JsonKey(
      includeFromJson: false, includeToJson: true, fromJson: HeroDto.fromJson)
  final String? image;

  @override
  String toString() {
    return 'HeroDto(id: $id, name: $name, description: $description, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeroDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HeroDtoImplCopyWith<_$HeroDtoImpl> get copyWith =>
      __$$HeroDtoImplCopyWithImpl<_$HeroDtoImpl>(this, _$identity);
}

abstract class _HeroDto extends HeroDto {
  factory _HeroDto(
      {final int? id,
      final String? name,
      final String? description,
      @JsonKey(
          includeFromJson: false,
          includeToJson: true,
          fromJson: HeroDto.fromJson)
      final String? image}) = _$HeroDtoImpl;
  _HeroDto._() : super._();

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get description;
  @override
  @JsonKey(
      includeFromJson: false, includeToJson: true, fromJson: HeroDto.fromJson)
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$HeroDtoImplCopyWith<_$HeroDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
