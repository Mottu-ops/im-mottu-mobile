// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marvel_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MarvelResponse _$MarvelResponseFromJson(Map<String, dynamic> json) {
  return _MarvelResponse.fromJson(json);
}

/// @nodoc
mixin _$MarvelResponse {
  String get etag => throw _privateConstructorUsedError;
  MarvelData get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarvelResponseCopyWith<MarvelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelResponseCopyWith<$Res> {
  factory $MarvelResponseCopyWith(
          MarvelResponse value, $Res Function(MarvelResponse) then) =
      _$MarvelResponseCopyWithImpl<$Res, MarvelResponse>;
  @useResult
  $Res call({String etag, MarvelData data});

  $MarvelDataCopyWith<$Res> get data;
}

/// @nodoc
class _$MarvelResponseCopyWithImpl<$Res, $Val extends MarvelResponse>
    implements $MarvelResponseCopyWith<$Res> {
  _$MarvelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? etag = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      etag: null == etag
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MarvelData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MarvelDataCopyWith<$Res> get data {
    return $MarvelDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MarvelResponseImplCopyWith<$Res>
    implements $MarvelResponseCopyWith<$Res> {
  factory _$$MarvelResponseImplCopyWith(_$MarvelResponseImpl value,
          $Res Function(_$MarvelResponseImpl) then) =
      __$$MarvelResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String etag, MarvelData data});

  @override
  $MarvelDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$MarvelResponseImplCopyWithImpl<$Res>
    extends _$MarvelResponseCopyWithImpl<$Res, _$MarvelResponseImpl>
    implements _$$MarvelResponseImplCopyWith<$Res> {
  __$$MarvelResponseImplCopyWithImpl(
      _$MarvelResponseImpl _value, $Res Function(_$MarvelResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? etag = null,
    Object? data = null,
  }) {
    return _then(_$MarvelResponseImpl(
      etag: null == etag
          ? _value.etag
          : etag // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MarvelData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarvelResponseImpl implements _MarvelResponse {
  const _$MarvelResponseImpl({required this.etag, required this.data});

  factory _$MarvelResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarvelResponseImplFromJson(json);

  @override
  final String etag;
  @override
  final MarvelData data;

  @override
  String toString() {
    return 'MarvelResponse(etag: $etag, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarvelResponseImpl &&
            (identical(other.etag, etag) || other.etag == etag) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, etag, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarvelResponseImplCopyWith<_$MarvelResponseImpl> get copyWith =>
      __$$MarvelResponseImplCopyWithImpl<_$MarvelResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarvelResponseImplToJson(
      this,
    );
  }
}

abstract class _MarvelResponse implements MarvelResponse {
  const factory _MarvelResponse(
      {required final String etag,
      required final MarvelData data}) = _$MarvelResponseImpl;

  factory _MarvelResponse.fromJson(Map<String, dynamic> json) =
      _$MarvelResponseImpl.fromJson;

  @override
  String get etag;
  @override
  MarvelData get data;
  @override
  @JsonKey(ignore: true)
  _$$MarvelResponseImplCopyWith<_$MarvelResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MarvelData _$MarvelDataFromJson(Map<String, dynamic> json) {
  return _MarvelData.fromJson(json);
}

/// @nodoc
mixin _$MarvelData {
  int get offset => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  List<MarvelCharacter> get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarvelDataCopyWith<MarvelData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelDataCopyWith<$Res> {
  factory $MarvelDataCopyWith(
          MarvelData value, $Res Function(MarvelData) then) =
      _$MarvelDataCopyWithImpl<$Res, MarvelData>;
  @useResult
  $Res call(
      {int offset,
      int limit,
      int total,
      int count,
      List<MarvelCharacter> results});
}

/// @nodoc
class _$MarvelDataCopyWithImpl<$Res, $Val extends MarvelData>
    implements $MarvelDataCopyWith<$Res> {
  _$MarvelDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offset = null,
    Object? limit = null,
    Object? total = null,
    Object? count = null,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MarvelCharacter>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarvelDataImplCopyWith<$Res>
    implements $MarvelDataCopyWith<$Res> {
  factory _$$MarvelDataImplCopyWith(
          _$MarvelDataImpl value, $Res Function(_$MarvelDataImpl) then) =
      __$$MarvelDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int offset,
      int limit,
      int total,
      int count,
      List<MarvelCharacter> results});
}

/// @nodoc
class __$$MarvelDataImplCopyWithImpl<$Res>
    extends _$MarvelDataCopyWithImpl<$Res, _$MarvelDataImpl>
    implements _$$MarvelDataImplCopyWith<$Res> {
  __$$MarvelDataImplCopyWithImpl(
      _$MarvelDataImpl _value, $Res Function(_$MarvelDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offset = null,
    Object? limit = null,
    Object? total = null,
    Object? count = null,
    Object? results = null,
  }) {
    return _then(_$MarvelDataImpl(
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MarvelCharacter>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarvelDataImpl implements _MarvelData {
  const _$MarvelDataImpl(
      {required this.offset,
      required this.limit,
      required this.total,
      required this.count,
      required final List<MarvelCharacter> results})
      : _results = results;

  factory _$MarvelDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarvelDataImplFromJson(json);

  @override
  final int offset;
  @override
  final int limit;
  @override
  final int total;
  @override
  final int count;
  final List<MarvelCharacter> _results;
  @override
  List<MarvelCharacter> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'MarvelData(offset: $offset, limit: $limit, total: $total, count: $count, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarvelDataImpl &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.count, count) || other.count == count) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, offset, limit, total, count,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarvelDataImplCopyWith<_$MarvelDataImpl> get copyWith =>
      __$$MarvelDataImplCopyWithImpl<_$MarvelDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarvelDataImplToJson(
      this,
    );
  }
}

abstract class _MarvelData implements MarvelData {
  const factory _MarvelData(
      {required final int offset,
      required final int limit,
      required final int total,
      required final int count,
      required final List<MarvelCharacter> results}) = _$MarvelDataImpl;

  factory _MarvelData.fromJson(Map<String, dynamic> json) =
      _$MarvelDataImpl.fromJson;

  @override
  int get offset;
  @override
  int get limit;
  @override
  int get total;
  @override
  int get count;
  @override
  List<MarvelCharacter> get results;
  @override
  @JsonKey(ignore: true)
  _$$MarvelDataImplCopyWith<_$MarvelDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MarvelCharacter _$MarvelCharacterFromJson(Map<String, dynamic> json) {
  return _MarvelCharacter.fromJson(json);
}

/// @nodoc
mixin _$MarvelCharacter {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  MarvelThumbnail get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarvelCharacterCopyWith<MarvelCharacter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelCharacterCopyWith<$Res> {
  factory $MarvelCharacterCopyWith(
          MarvelCharacter value, $Res Function(MarvelCharacter) then) =
      _$MarvelCharacterCopyWithImpl<$Res, MarvelCharacter>;
  @useResult
  $Res call(
      {int id, String name, String description, MarvelThumbnail thumbnail});

  $MarvelThumbnailCopyWith<$Res> get thumbnail;
}

/// @nodoc
class _$MarvelCharacterCopyWithImpl<$Res, $Val extends MarvelCharacter>
    implements $MarvelCharacterCopyWith<$Res> {
  _$MarvelCharacterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? thumbnail = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as MarvelThumbnail,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MarvelThumbnailCopyWith<$Res> get thumbnail {
    return $MarvelThumbnailCopyWith<$Res>(_value.thumbnail, (value) {
      return _then(_value.copyWith(thumbnail: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MarvelCharacterImplCopyWith<$Res>
    implements $MarvelCharacterCopyWith<$Res> {
  factory _$$MarvelCharacterImplCopyWith(_$MarvelCharacterImpl value,
          $Res Function(_$MarvelCharacterImpl) then) =
      __$$MarvelCharacterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, String description, MarvelThumbnail thumbnail});

  @override
  $MarvelThumbnailCopyWith<$Res> get thumbnail;
}

/// @nodoc
class __$$MarvelCharacterImplCopyWithImpl<$Res>
    extends _$MarvelCharacterCopyWithImpl<$Res, _$MarvelCharacterImpl>
    implements _$$MarvelCharacterImplCopyWith<$Res> {
  __$$MarvelCharacterImplCopyWithImpl(
      _$MarvelCharacterImpl _value, $Res Function(_$MarvelCharacterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? thumbnail = null,
  }) {
    return _then(_$MarvelCharacterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as MarvelThumbnail,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarvelCharacterImpl implements _MarvelCharacter {
  const _$MarvelCharacterImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.thumbnail});

  factory _$MarvelCharacterImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarvelCharacterImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final MarvelThumbnail thumbnail;

  @override
  String toString() {
    return 'MarvelCharacter(id: $id, name: $name, description: $description, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarvelCharacterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, thumbnail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarvelCharacterImplCopyWith<_$MarvelCharacterImpl> get copyWith =>
      __$$MarvelCharacterImplCopyWithImpl<_$MarvelCharacterImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarvelCharacterImplToJson(
      this,
    );
  }
}

abstract class _MarvelCharacter implements MarvelCharacter {
  const factory _MarvelCharacter(
      {required final int id,
      required final String name,
      required final String description,
      required final MarvelThumbnail thumbnail}) = _$MarvelCharacterImpl;

  factory _MarvelCharacter.fromJson(Map<String, dynamic> json) =
      _$MarvelCharacterImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  MarvelThumbnail get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$$MarvelCharacterImplCopyWith<_$MarvelCharacterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MarvelThumbnail _$MarvelThumbnailFromJson(Map<String, dynamic> json) {
  return _MarvelThumbnail.fromJson(json);
}

/// @nodoc
mixin _$MarvelThumbnail {
  String get path => throw _privateConstructorUsedError;
  String get extension => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarvelThumbnailCopyWith<MarvelThumbnail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelThumbnailCopyWith<$Res> {
  factory $MarvelThumbnailCopyWith(
          MarvelThumbnail value, $Res Function(MarvelThumbnail) then) =
      _$MarvelThumbnailCopyWithImpl<$Res, MarvelThumbnail>;
  @useResult
  $Res call({String path, String extension});
}

/// @nodoc
class _$MarvelThumbnailCopyWithImpl<$Res, $Val extends MarvelThumbnail>
    implements $MarvelThumbnailCopyWith<$Res> {
  _$MarvelThumbnailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? extension = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      extension: null == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarvelThumbnailImplCopyWith<$Res>
    implements $MarvelThumbnailCopyWith<$Res> {
  factory _$$MarvelThumbnailImplCopyWith(_$MarvelThumbnailImpl value,
          $Res Function(_$MarvelThumbnailImpl) then) =
      __$$MarvelThumbnailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String path, String extension});
}

/// @nodoc
class __$$MarvelThumbnailImplCopyWithImpl<$Res>
    extends _$MarvelThumbnailCopyWithImpl<$Res, _$MarvelThumbnailImpl>
    implements _$$MarvelThumbnailImplCopyWith<$Res> {
  __$$MarvelThumbnailImplCopyWithImpl(
      _$MarvelThumbnailImpl _value, $Res Function(_$MarvelThumbnailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? extension = null,
  }) {
    return _then(_$MarvelThumbnailImpl(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      extension: null == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarvelThumbnailImpl implements _MarvelThumbnail {
  const _$MarvelThumbnailImpl({required this.path, required this.extension});

  factory _$MarvelThumbnailImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarvelThumbnailImplFromJson(json);

  @override
  final String path;
  @override
  final String extension;

  @override
  String toString() {
    return 'MarvelThumbnail(path: $path, extension: $extension)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarvelThumbnailImpl &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.extension, extension) ||
                other.extension == extension));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, path, extension);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarvelThumbnailImplCopyWith<_$MarvelThumbnailImpl> get copyWith =>
      __$$MarvelThumbnailImplCopyWithImpl<_$MarvelThumbnailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarvelThumbnailImplToJson(
      this,
    );
  }
}

abstract class _MarvelThumbnail implements MarvelThumbnail {
  const factory _MarvelThumbnail(
      {required final String path,
      required final String extension}) = _$MarvelThumbnailImpl;

  factory _MarvelThumbnail.fromJson(Map<String, dynamic> json) =
      _$MarvelThumbnailImpl.fromJson;

  @override
  String get path;
  @override
  String get extension;
  @override
  @JsonKey(ignore: true)
  _$$MarvelThumbnailImplCopyWith<_$MarvelThumbnailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
