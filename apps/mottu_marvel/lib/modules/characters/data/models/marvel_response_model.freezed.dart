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
  MarvelComics get comics => throw _privateConstructorUsedError;
  MarvelSeries get series => throw _privateConstructorUsedError;
  MarvelStories get stories => throw _privateConstructorUsedError;
  MarvelEvents get events => throw _privateConstructorUsedError;

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
      {int id,
      String name,
      String description,
      MarvelThumbnail thumbnail,
      MarvelComics comics,
      MarvelSeries series,
      MarvelStories stories,
      MarvelEvents events});

  $MarvelThumbnailCopyWith<$Res> get thumbnail;
  $MarvelComicsCopyWith<$Res> get comics;
  $MarvelSeriesCopyWith<$Res> get series;
  $MarvelStoriesCopyWith<$Res> get stories;
  $MarvelEventsCopyWith<$Res> get events;
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
    Object? comics = null,
    Object? series = null,
    Object? stories = null,
    Object? events = null,
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
      comics: null == comics
          ? _value.comics
          : comics // ignore: cast_nullable_to_non_nullable
              as MarvelComics,
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as MarvelSeries,
      stories: null == stories
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as MarvelStories,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as MarvelEvents,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MarvelThumbnailCopyWith<$Res> get thumbnail {
    return $MarvelThumbnailCopyWith<$Res>(_value.thumbnail, (value) {
      return _then(_value.copyWith(thumbnail: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MarvelComicsCopyWith<$Res> get comics {
    return $MarvelComicsCopyWith<$Res>(_value.comics, (value) {
      return _then(_value.copyWith(comics: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MarvelSeriesCopyWith<$Res> get series {
    return $MarvelSeriesCopyWith<$Res>(_value.series, (value) {
      return _then(_value.copyWith(series: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MarvelStoriesCopyWith<$Res> get stories {
    return $MarvelStoriesCopyWith<$Res>(_value.stories, (value) {
      return _then(_value.copyWith(stories: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MarvelEventsCopyWith<$Res> get events {
    return $MarvelEventsCopyWith<$Res>(_value.events, (value) {
      return _then(_value.copyWith(events: value) as $Val);
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
      {int id,
      String name,
      String description,
      MarvelThumbnail thumbnail,
      MarvelComics comics,
      MarvelSeries series,
      MarvelStories stories,
      MarvelEvents events});

  @override
  $MarvelThumbnailCopyWith<$Res> get thumbnail;
  @override
  $MarvelComicsCopyWith<$Res> get comics;
  @override
  $MarvelSeriesCopyWith<$Res> get series;
  @override
  $MarvelStoriesCopyWith<$Res> get stories;
  @override
  $MarvelEventsCopyWith<$Res> get events;
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
    Object? comics = null,
    Object? series = null,
    Object? stories = null,
    Object? events = null,
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
      comics: null == comics
          ? _value.comics
          : comics // ignore: cast_nullable_to_non_nullable
              as MarvelComics,
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as MarvelSeries,
      stories: null == stories
          ? _value.stories
          : stories // ignore: cast_nullable_to_non_nullable
              as MarvelStories,
      events: null == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as MarvelEvents,
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
      required this.thumbnail,
      required this.comics,
      required this.series,
      required this.stories,
      required this.events});

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
  final MarvelComics comics;
  @override
  final MarvelSeries series;
  @override
  final MarvelStories stories;
  @override
  final MarvelEvents events;

  @override
  String toString() {
    return 'MarvelCharacter(id: $id, name: $name, description: $description, thumbnail: $thumbnail, comics: $comics, series: $series, stories: $stories, events: $events)';
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
                other.thumbnail == thumbnail) &&
            (identical(other.comics, comics) || other.comics == comics) &&
            (identical(other.series, series) || other.series == series) &&
            (identical(other.stories, stories) || other.stories == stories) &&
            (identical(other.events, events) || other.events == events));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, thumbnail,
      comics, series, stories, events);

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
      required final MarvelThumbnail thumbnail,
      required final MarvelComics comics,
      required final MarvelSeries series,
      required final MarvelStories stories,
      required final MarvelEvents events}) = _$MarvelCharacterImpl;

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
  MarvelComics get comics;
  @override
  MarvelSeries get series;
  @override
  MarvelStories get stories;
  @override
  MarvelEvents get events;
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

MarvelComics _$MarvelComicsFromJson(Map<String, dynamic> json) {
  return _MarvelComics.fromJson(json);
}

/// @nodoc
mixin _$MarvelComics {
  int get available => throw _privateConstructorUsedError;
  String get collectionURI => throw _privateConstructorUsedError;
  List<MarvelItem> get items => throw _privateConstructorUsedError;
  int get returned => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarvelComicsCopyWith<MarvelComics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelComicsCopyWith<$Res> {
  factory $MarvelComicsCopyWith(
          MarvelComics value, $Res Function(MarvelComics) then) =
      _$MarvelComicsCopyWithImpl<$Res, MarvelComics>;
  @useResult
  $Res call(
      {int available,
      String collectionURI,
      List<MarvelItem> items,
      int returned});
}

/// @nodoc
class _$MarvelComicsCopyWithImpl<$Res, $Val extends MarvelComics>
    implements $MarvelComicsCopyWith<$Res> {
  _$MarvelComicsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
    Object? collectionURI = null,
    Object? items = null,
    Object? returned = null,
  }) {
    return _then(_value.copyWith(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int,
      collectionURI: null == collectionURI
          ? _value.collectionURI
          : collectionURI // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MarvelItem>,
      returned: null == returned
          ? _value.returned
          : returned // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarvelComicsImplCopyWith<$Res>
    implements $MarvelComicsCopyWith<$Res> {
  factory _$$MarvelComicsImplCopyWith(
          _$MarvelComicsImpl value, $Res Function(_$MarvelComicsImpl) then) =
      __$$MarvelComicsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int available,
      String collectionURI,
      List<MarvelItem> items,
      int returned});
}

/// @nodoc
class __$$MarvelComicsImplCopyWithImpl<$Res>
    extends _$MarvelComicsCopyWithImpl<$Res, _$MarvelComicsImpl>
    implements _$$MarvelComicsImplCopyWith<$Res> {
  __$$MarvelComicsImplCopyWithImpl(
      _$MarvelComicsImpl _value, $Res Function(_$MarvelComicsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
    Object? collectionURI = null,
    Object? items = null,
    Object? returned = null,
  }) {
    return _then(_$MarvelComicsImpl(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int,
      collectionURI: null == collectionURI
          ? _value.collectionURI
          : collectionURI // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MarvelItem>,
      returned: null == returned
          ? _value.returned
          : returned // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarvelComicsImpl implements _MarvelComics {
  const _$MarvelComicsImpl(
      {required this.available,
      required this.collectionURI,
      required final List<MarvelItem> items,
      required this.returned})
      : _items = items;

  factory _$MarvelComicsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarvelComicsImplFromJson(json);

  @override
  final int available;
  @override
  final String collectionURI;
  final List<MarvelItem> _items;
  @override
  List<MarvelItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int returned;

  @override
  String toString() {
    return 'MarvelComics(available: $available, collectionURI: $collectionURI, items: $items, returned: $returned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarvelComicsImpl &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.collectionURI, collectionURI) ||
                other.collectionURI == collectionURI) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.returned, returned) ||
                other.returned == returned));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, available, collectionURI,
      const DeepCollectionEquality().hash(_items), returned);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarvelComicsImplCopyWith<_$MarvelComicsImpl> get copyWith =>
      __$$MarvelComicsImplCopyWithImpl<_$MarvelComicsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarvelComicsImplToJson(
      this,
    );
  }
}

abstract class _MarvelComics implements MarvelComics {
  const factory _MarvelComics(
      {required final int available,
      required final String collectionURI,
      required final List<MarvelItem> items,
      required final int returned}) = _$MarvelComicsImpl;

  factory _MarvelComics.fromJson(Map<String, dynamic> json) =
      _$MarvelComicsImpl.fromJson;

  @override
  int get available;
  @override
  String get collectionURI;
  @override
  List<MarvelItem> get items;
  @override
  int get returned;
  @override
  @JsonKey(ignore: true)
  _$$MarvelComicsImplCopyWith<_$MarvelComicsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MarvelItem _$MarvelItemFromJson(Map<String, dynamic> json) {
  return _MarvelItem.fromJson(json);
}

/// @nodoc
mixin _$MarvelItem {
  String get resourceURI => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarvelItemCopyWith<MarvelItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelItemCopyWith<$Res> {
  factory $MarvelItemCopyWith(
          MarvelItem value, $Res Function(MarvelItem) then) =
      _$MarvelItemCopyWithImpl<$Res, MarvelItem>;
  @useResult
  $Res call({String resourceURI, String name});
}

/// @nodoc
class _$MarvelItemCopyWithImpl<$Res, $Val extends MarvelItem>
    implements $MarvelItemCopyWith<$Res> {
  _$MarvelItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resourceURI = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      resourceURI: null == resourceURI
          ? _value.resourceURI
          : resourceURI // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarvelItemImplCopyWith<$Res>
    implements $MarvelItemCopyWith<$Res> {
  factory _$$MarvelItemImplCopyWith(
          _$MarvelItemImpl value, $Res Function(_$MarvelItemImpl) then) =
      __$$MarvelItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String resourceURI, String name});
}

/// @nodoc
class __$$MarvelItemImplCopyWithImpl<$Res>
    extends _$MarvelItemCopyWithImpl<$Res, _$MarvelItemImpl>
    implements _$$MarvelItemImplCopyWith<$Res> {
  __$$MarvelItemImplCopyWithImpl(
      _$MarvelItemImpl _value, $Res Function(_$MarvelItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resourceURI = null,
    Object? name = null,
  }) {
    return _then(_$MarvelItemImpl(
      resourceURI: null == resourceURI
          ? _value.resourceURI
          : resourceURI // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarvelItemImpl implements _MarvelItem {
  const _$MarvelItemImpl({required this.resourceURI, required this.name});

  factory _$MarvelItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarvelItemImplFromJson(json);

  @override
  final String resourceURI;
  @override
  final String name;

  @override
  String toString() {
    return 'MarvelItem(resourceURI: $resourceURI, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarvelItemImpl &&
            (identical(other.resourceURI, resourceURI) ||
                other.resourceURI == resourceURI) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, resourceURI, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarvelItemImplCopyWith<_$MarvelItemImpl> get copyWith =>
      __$$MarvelItemImplCopyWithImpl<_$MarvelItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarvelItemImplToJson(
      this,
    );
  }
}

abstract class _MarvelItem implements MarvelItem {
  const factory _MarvelItem(
      {required final String resourceURI,
      required final String name}) = _$MarvelItemImpl;

  factory _MarvelItem.fromJson(Map<String, dynamic> json) =
      _$MarvelItemImpl.fromJson;

  @override
  String get resourceURI;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$MarvelItemImplCopyWith<_$MarvelItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MarvelSeries _$MarvelSeriesFromJson(Map<String, dynamic> json) {
  return _MarvelSeries.fromJson(json);
}

/// @nodoc
mixin _$MarvelSeries {
  int get available => throw _privateConstructorUsedError;
  String get collectionURI => throw _privateConstructorUsedError;
  List<MarvelItem> get items => throw _privateConstructorUsedError;
  int get returned => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarvelSeriesCopyWith<MarvelSeries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelSeriesCopyWith<$Res> {
  factory $MarvelSeriesCopyWith(
          MarvelSeries value, $Res Function(MarvelSeries) then) =
      _$MarvelSeriesCopyWithImpl<$Res, MarvelSeries>;
  @useResult
  $Res call(
      {int available,
      String collectionURI,
      List<MarvelItem> items,
      int returned});
}

/// @nodoc
class _$MarvelSeriesCopyWithImpl<$Res, $Val extends MarvelSeries>
    implements $MarvelSeriesCopyWith<$Res> {
  _$MarvelSeriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
    Object? collectionURI = null,
    Object? items = null,
    Object? returned = null,
  }) {
    return _then(_value.copyWith(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int,
      collectionURI: null == collectionURI
          ? _value.collectionURI
          : collectionURI // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MarvelItem>,
      returned: null == returned
          ? _value.returned
          : returned // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarvelSeriesImplCopyWith<$Res>
    implements $MarvelSeriesCopyWith<$Res> {
  factory _$$MarvelSeriesImplCopyWith(
          _$MarvelSeriesImpl value, $Res Function(_$MarvelSeriesImpl) then) =
      __$$MarvelSeriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int available,
      String collectionURI,
      List<MarvelItem> items,
      int returned});
}

/// @nodoc
class __$$MarvelSeriesImplCopyWithImpl<$Res>
    extends _$MarvelSeriesCopyWithImpl<$Res, _$MarvelSeriesImpl>
    implements _$$MarvelSeriesImplCopyWith<$Res> {
  __$$MarvelSeriesImplCopyWithImpl(
      _$MarvelSeriesImpl _value, $Res Function(_$MarvelSeriesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
    Object? collectionURI = null,
    Object? items = null,
    Object? returned = null,
  }) {
    return _then(_$MarvelSeriesImpl(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int,
      collectionURI: null == collectionURI
          ? _value.collectionURI
          : collectionURI // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MarvelItem>,
      returned: null == returned
          ? _value.returned
          : returned // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarvelSeriesImpl implements _MarvelSeries {
  const _$MarvelSeriesImpl(
      {required this.available,
      required this.collectionURI,
      required final List<MarvelItem> items,
      required this.returned})
      : _items = items;

  factory _$MarvelSeriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarvelSeriesImplFromJson(json);

  @override
  final int available;
  @override
  final String collectionURI;
  final List<MarvelItem> _items;
  @override
  List<MarvelItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int returned;

  @override
  String toString() {
    return 'MarvelSeries(available: $available, collectionURI: $collectionURI, items: $items, returned: $returned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarvelSeriesImpl &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.collectionURI, collectionURI) ||
                other.collectionURI == collectionURI) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.returned, returned) ||
                other.returned == returned));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, available, collectionURI,
      const DeepCollectionEquality().hash(_items), returned);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarvelSeriesImplCopyWith<_$MarvelSeriesImpl> get copyWith =>
      __$$MarvelSeriesImplCopyWithImpl<_$MarvelSeriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarvelSeriesImplToJson(
      this,
    );
  }
}

abstract class _MarvelSeries implements MarvelSeries {
  const factory _MarvelSeries(
      {required final int available,
      required final String collectionURI,
      required final List<MarvelItem> items,
      required final int returned}) = _$MarvelSeriesImpl;

  factory _MarvelSeries.fromJson(Map<String, dynamic> json) =
      _$MarvelSeriesImpl.fromJson;

  @override
  int get available;
  @override
  String get collectionURI;
  @override
  List<MarvelItem> get items;
  @override
  int get returned;
  @override
  @JsonKey(ignore: true)
  _$$MarvelSeriesImplCopyWith<_$MarvelSeriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MarvelStories _$MarvelStoriesFromJson(Map<String, dynamic> json) {
  return _MarvelStories.fromJson(json);
}

/// @nodoc
mixin _$MarvelStories {
  int get available => throw _privateConstructorUsedError;
  String get collectionURI => throw _privateConstructorUsedError;
  List<MarvelStoryItem> get items => throw _privateConstructorUsedError;
  int get returned => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarvelStoriesCopyWith<MarvelStories> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelStoriesCopyWith<$Res> {
  factory $MarvelStoriesCopyWith(
          MarvelStories value, $Res Function(MarvelStories) then) =
      _$MarvelStoriesCopyWithImpl<$Res, MarvelStories>;
  @useResult
  $Res call(
      {int available,
      String collectionURI,
      List<MarvelStoryItem> items,
      int returned});
}

/// @nodoc
class _$MarvelStoriesCopyWithImpl<$Res, $Val extends MarvelStories>
    implements $MarvelStoriesCopyWith<$Res> {
  _$MarvelStoriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
    Object? collectionURI = null,
    Object? items = null,
    Object? returned = null,
  }) {
    return _then(_value.copyWith(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int,
      collectionURI: null == collectionURI
          ? _value.collectionURI
          : collectionURI // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MarvelStoryItem>,
      returned: null == returned
          ? _value.returned
          : returned // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarvelStoriesImplCopyWith<$Res>
    implements $MarvelStoriesCopyWith<$Res> {
  factory _$$MarvelStoriesImplCopyWith(
          _$MarvelStoriesImpl value, $Res Function(_$MarvelStoriesImpl) then) =
      __$$MarvelStoriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int available,
      String collectionURI,
      List<MarvelStoryItem> items,
      int returned});
}

/// @nodoc
class __$$MarvelStoriesImplCopyWithImpl<$Res>
    extends _$MarvelStoriesCopyWithImpl<$Res, _$MarvelStoriesImpl>
    implements _$$MarvelStoriesImplCopyWith<$Res> {
  __$$MarvelStoriesImplCopyWithImpl(
      _$MarvelStoriesImpl _value, $Res Function(_$MarvelStoriesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
    Object? collectionURI = null,
    Object? items = null,
    Object? returned = null,
  }) {
    return _then(_$MarvelStoriesImpl(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int,
      collectionURI: null == collectionURI
          ? _value.collectionURI
          : collectionURI // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MarvelStoryItem>,
      returned: null == returned
          ? _value.returned
          : returned // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarvelStoriesImpl implements _MarvelStories {
  const _$MarvelStoriesImpl(
      {required this.available,
      required this.collectionURI,
      required final List<MarvelStoryItem> items,
      required this.returned})
      : _items = items;

  factory _$MarvelStoriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarvelStoriesImplFromJson(json);

  @override
  final int available;
  @override
  final String collectionURI;
  final List<MarvelStoryItem> _items;
  @override
  List<MarvelStoryItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int returned;

  @override
  String toString() {
    return 'MarvelStories(available: $available, collectionURI: $collectionURI, items: $items, returned: $returned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarvelStoriesImpl &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.collectionURI, collectionURI) ||
                other.collectionURI == collectionURI) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.returned, returned) ||
                other.returned == returned));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, available, collectionURI,
      const DeepCollectionEquality().hash(_items), returned);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarvelStoriesImplCopyWith<_$MarvelStoriesImpl> get copyWith =>
      __$$MarvelStoriesImplCopyWithImpl<_$MarvelStoriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarvelStoriesImplToJson(
      this,
    );
  }
}

abstract class _MarvelStories implements MarvelStories {
  const factory _MarvelStories(
      {required final int available,
      required final String collectionURI,
      required final List<MarvelStoryItem> items,
      required final int returned}) = _$MarvelStoriesImpl;

  factory _MarvelStories.fromJson(Map<String, dynamic> json) =
      _$MarvelStoriesImpl.fromJson;

  @override
  int get available;
  @override
  String get collectionURI;
  @override
  List<MarvelStoryItem> get items;
  @override
  int get returned;
  @override
  @JsonKey(ignore: true)
  _$$MarvelStoriesImplCopyWith<_$MarvelStoriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MarvelStoryItem _$MarvelStoryItemFromJson(Map<String, dynamic> json) {
  return _MarvelStoryItem.fromJson(json);
}

/// @nodoc
mixin _$MarvelStoryItem {
  String get resourceURI => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarvelStoryItemCopyWith<MarvelStoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelStoryItemCopyWith<$Res> {
  factory $MarvelStoryItemCopyWith(
          MarvelStoryItem value, $Res Function(MarvelStoryItem) then) =
      _$MarvelStoryItemCopyWithImpl<$Res, MarvelStoryItem>;
  @useResult
  $Res call({String resourceURI, String name, String type});
}

/// @nodoc
class _$MarvelStoryItemCopyWithImpl<$Res, $Val extends MarvelStoryItem>
    implements $MarvelStoryItemCopyWith<$Res> {
  _$MarvelStoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resourceURI = null,
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      resourceURI: null == resourceURI
          ? _value.resourceURI
          : resourceURI // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarvelStoryItemImplCopyWith<$Res>
    implements $MarvelStoryItemCopyWith<$Res> {
  factory _$$MarvelStoryItemImplCopyWith(_$MarvelStoryItemImpl value,
          $Res Function(_$MarvelStoryItemImpl) then) =
      __$$MarvelStoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String resourceURI, String name, String type});
}

/// @nodoc
class __$$MarvelStoryItemImplCopyWithImpl<$Res>
    extends _$MarvelStoryItemCopyWithImpl<$Res, _$MarvelStoryItemImpl>
    implements _$$MarvelStoryItemImplCopyWith<$Res> {
  __$$MarvelStoryItemImplCopyWithImpl(
      _$MarvelStoryItemImpl _value, $Res Function(_$MarvelStoryItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resourceURI = null,
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_$MarvelStoryItemImpl(
      resourceURI: null == resourceURI
          ? _value.resourceURI
          : resourceURI // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarvelStoryItemImpl implements _MarvelStoryItem {
  const _$MarvelStoryItemImpl(
      {required this.resourceURI, required this.name, required this.type});

  factory _$MarvelStoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarvelStoryItemImplFromJson(json);

  @override
  final String resourceURI;
  @override
  final String name;
  @override
  final String type;

  @override
  String toString() {
    return 'MarvelStoryItem(resourceURI: $resourceURI, name: $name, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarvelStoryItemImpl &&
            (identical(other.resourceURI, resourceURI) ||
                other.resourceURI == resourceURI) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, resourceURI, name, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarvelStoryItemImplCopyWith<_$MarvelStoryItemImpl> get copyWith =>
      __$$MarvelStoryItemImplCopyWithImpl<_$MarvelStoryItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarvelStoryItemImplToJson(
      this,
    );
  }
}

abstract class _MarvelStoryItem implements MarvelStoryItem {
  const factory _MarvelStoryItem(
      {required final String resourceURI,
      required final String name,
      required final String type}) = _$MarvelStoryItemImpl;

  factory _MarvelStoryItem.fromJson(Map<String, dynamic> json) =
      _$MarvelStoryItemImpl.fromJson;

  @override
  String get resourceURI;
  @override
  String get name;
  @override
  String get type;
  @override
  @JsonKey(ignore: true)
  _$$MarvelStoryItemImplCopyWith<_$MarvelStoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MarvelEvents _$MarvelEventsFromJson(Map<String, dynamic> json) {
  return _MarvelEvents.fromJson(json);
}

/// @nodoc
mixin _$MarvelEvents {
  int get available => throw _privateConstructorUsedError;
  String get collectionURI => throw _privateConstructorUsedError;
  List<MarvelItem> get items => throw _privateConstructorUsedError;
  int get returned => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarvelEventsCopyWith<MarvelEvents> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarvelEventsCopyWith<$Res> {
  factory $MarvelEventsCopyWith(
          MarvelEvents value, $Res Function(MarvelEvents) then) =
      _$MarvelEventsCopyWithImpl<$Res, MarvelEvents>;
  @useResult
  $Res call(
      {int available,
      String collectionURI,
      List<MarvelItem> items,
      int returned});
}

/// @nodoc
class _$MarvelEventsCopyWithImpl<$Res, $Val extends MarvelEvents>
    implements $MarvelEventsCopyWith<$Res> {
  _$MarvelEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
    Object? collectionURI = null,
    Object? items = null,
    Object? returned = null,
  }) {
    return _then(_value.copyWith(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int,
      collectionURI: null == collectionURI
          ? _value.collectionURI
          : collectionURI // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MarvelItem>,
      returned: null == returned
          ? _value.returned
          : returned // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarvelEventsImplCopyWith<$Res>
    implements $MarvelEventsCopyWith<$Res> {
  factory _$$MarvelEventsImplCopyWith(
          _$MarvelEventsImpl value, $Res Function(_$MarvelEventsImpl) then) =
      __$$MarvelEventsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int available,
      String collectionURI,
      List<MarvelItem> items,
      int returned});
}

/// @nodoc
class __$$MarvelEventsImplCopyWithImpl<$Res>
    extends _$MarvelEventsCopyWithImpl<$Res, _$MarvelEventsImpl>
    implements _$$MarvelEventsImplCopyWith<$Res> {
  __$$MarvelEventsImplCopyWithImpl(
      _$MarvelEventsImpl _value, $Res Function(_$MarvelEventsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? available = null,
    Object? collectionURI = null,
    Object? items = null,
    Object? returned = null,
  }) {
    return _then(_$MarvelEventsImpl(
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as int,
      collectionURI: null == collectionURI
          ? _value.collectionURI
          : collectionURI // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<MarvelItem>,
      returned: null == returned
          ? _value.returned
          : returned // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarvelEventsImpl implements _MarvelEvents {
  const _$MarvelEventsImpl(
      {required this.available,
      required this.collectionURI,
      required final List<MarvelItem> items,
      required this.returned})
      : _items = items;

  factory _$MarvelEventsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarvelEventsImplFromJson(json);

  @override
  final int available;
  @override
  final String collectionURI;
  final List<MarvelItem> _items;
  @override
  List<MarvelItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int returned;

  @override
  String toString() {
    return 'MarvelEvents(available: $available, collectionURI: $collectionURI, items: $items, returned: $returned)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarvelEventsImpl &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.collectionURI, collectionURI) ||
                other.collectionURI == collectionURI) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.returned, returned) ||
                other.returned == returned));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, available, collectionURI,
      const DeepCollectionEquality().hash(_items), returned);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarvelEventsImplCopyWith<_$MarvelEventsImpl> get copyWith =>
      __$$MarvelEventsImplCopyWithImpl<_$MarvelEventsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarvelEventsImplToJson(
      this,
    );
  }
}

abstract class _MarvelEvents implements MarvelEvents {
  const factory _MarvelEvents(
      {required final int available,
      required final String collectionURI,
      required final List<MarvelItem> items,
      required final int returned}) = _$MarvelEventsImpl;

  factory _MarvelEvents.fromJson(Map<String, dynamic> json) =
      _$MarvelEventsImpl.fromJson;

  @override
  int get available;
  @override
  String get collectionURI;
  @override
  List<MarvelItem> get items;
  @override
  int get returned;
  @override
  @JsonKey(ignore: true)
  _$$MarvelEventsImplCopyWith<_$MarvelEventsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
