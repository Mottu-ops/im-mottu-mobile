// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'params_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ParamsDto _$ParamsDtoFromJson(Map<String, dynamic> json) {
  return _ParamsDto.fromJson(json);
}

/// @nodoc
mixin _$ParamsDto {
  int? get limit => throw _privateConstructorUsedError;
  int? get offset => throw _privateConstructorUsedError;
  String? get nameStartsWith => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParamsDtoCopyWith<ParamsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParamsDtoCopyWith<$Res> {
  factory $ParamsDtoCopyWith(ParamsDto value, $Res Function(ParamsDto) then) =
      _$ParamsDtoCopyWithImpl<$Res, ParamsDto>;
  @useResult
  $Res call({int? limit, int? offset, String? nameStartsWith});
}

/// @nodoc
class _$ParamsDtoCopyWithImpl<$Res, $Val extends ParamsDto>
    implements $ParamsDtoCopyWith<$Res> {
  _$ParamsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? offset = freezed,
    Object? nameStartsWith = freezed,
  }) {
    return _then(_value.copyWith(
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      nameStartsWith: freezed == nameStartsWith
          ? _value.nameStartsWith
          : nameStartsWith // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParamsDtoImplCopyWith<$Res>
    implements $ParamsDtoCopyWith<$Res> {
  factory _$$ParamsDtoImplCopyWith(
          _$ParamsDtoImpl value, $Res Function(_$ParamsDtoImpl) then) =
      __$$ParamsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? limit, int? offset, String? nameStartsWith});
}

/// @nodoc
class __$$ParamsDtoImplCopyWithImpl<$Res>
    extends _$ParamsDtoCopyWithImpl<$Res, _$ParamsDtoImpl>
    implements _$$ParamsDtoImplCopyWith<$Res> {
  __$$ParamsDtoImplCopyWithImpl(
      _$ParamsDtoImpl _value, $Res Function(_$ParamsDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = freezed,
    Object? offset = freezed,
    Object? nameStartsWith = freezed,
  }) {
    return _then(_$ParamsDtoImpl(
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
      nameStartsWith: freezed == nameStartsWith
          ? _value.nameStartsWith
          : nameStartsWith // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParamsDtoImpl implements _ParamsDto {
  _$ParamsDtoImpl({this.limit = 10, this.offset = 0, this.nameStartsWith = ''});

  factory _$ParamsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParamsDtoImplFromJson(json);

  @override
  @JsonKey()
  final int? limit;
  @override
  @JsonKey()
  final int? offset;
  @override
  @JsonKey()
  final String? nameStartsWith;

  @override
  String toString() {
    return 'ParamsDto(limit: $limit, offset: $offset, nameStartsWith: $nameStartsWith)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParamsDtoImpl &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.nameStartsWith, nameStartsWith) ||
                other.nameStartsWith == nameStartsWith));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, limit, offset, nameStartsWith);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ParamsDtoImplCopyWith<_$ParamsDtoImpl> get copyWith =>
      __$$ParamsDtoImplCopyWithImpl<_$ParamsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParamsDtoImplToJson(
      this,
    );
  }
}

abstract class _ParamsDto implements ParamsDto {
  factory _ParamsDto(
      {final int? limit,
      final int? offset,
      final String? nameStartsWith}) = _$ParamsDtoImpl;

  factory _ParamsDto.fromJson(Map<String, dynamic> json) =
      _$ParamsDtoImpl.fromJson;

  @override
  int? get limit;
  @override
  int? get offset;
  @override
  String? get nameStartsWith;
  @override
  @JsonKey(ignore: true)
  _$$ParamsDtoImplCopyWith<_$ParamsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
