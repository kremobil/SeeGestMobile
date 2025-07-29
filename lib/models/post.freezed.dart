// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostModel {
  int get id;
  String get title;
  String get content;
  DateTime get createdAt;
  UserModel get author;
  List<TagsModel> get tags;
  IconModel get icon;
  bool get isAnonymous;
  double get latitude;
  double get longitude;
  String get location;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PostModelCopyWith<PostModel> get copyWith =>
      _$PostModelCopyWithImpl<PostModel>(this as PostModel, _$identity);

  /// Serializes this PostModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PostModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.author, author) || other.author == author) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      createdAt,
      author,
      const DeepCollectionEquality().hash(tags),
      icon,
      isAnonymous,
      latitude,
      longitude,
      location);

  @override
  String toString() {
    return 'PostModel(id: $id, title: $title, content: $content, createdAt: $createdAt, author: $author, tags: $tags, icon: $icon, isAnonymous: $isAnonymous, latitude: $latitude, longitude: $longitude, location: $location)';
  }
}

/// @nodoc
abstract mixin class $PostModelCopyWith<$Res> {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) _then) =
      _$PostModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String title,
      String content,
      DateTime createdAt,
      UserModel author,
      List<TagsModel> tags,
      IconModel icon,
      bool isAnonymous,
      double latitude,
      double longitude,
      String location});

  $UserModelCopyWith<$Res> get author;
  $IconModelCopyWith<$Res> get icon;
}

/// @nodoc
class _$PostModelCopyWithImpl<$Res> implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._self, this._then);

  final PostModel _self;
  final $Res Function(PostModel) _then;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? createdAt = null,
    Object? author = null,
    Object? tags = null,
    Object? icon = null,
    Object? isAnonymous = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? location = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as UserModel,
      tags: null == tags
          ? _self.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagsModel>,
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconModel,
      isAnonymous: null == isAnonymous
          ? _self.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get author {
    return $UserModelCopyWith<$Res>(_self.author, (value) {
      return _then(_self.copyWith(author: value));
    });
  }

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IconModelCopyWith<$Res> get icon {
    return $IconModelCopyWith<$Res>(_self.icon, (value) {
      return _then(_self.copyWith(icon: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _PostModel implements PostModel {
  const _PostModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.createdAt,
      required this.author,
      required final List<TagsModel> tags,
      required this.icon,
      required this.isAnonymous,
      required this.latitude,
      required this.longitude,
      required this.location})
      : _tags = tags;
  factory _PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final UserModel author;
  final List<TagsModel> _tags;
  @override
  List<TagsModel> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final IconModel icon;
  @override
  final bool isAnonymous;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  final String location;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PostModelCopyWith<_PostModel> get copyWith =>
      __$PostModelCopyWithImpl<_PostModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PostModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.author, author) || other.author == author) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      createdAt,
      author,
      const DeepCollectionEquality().hash(_tags),
      icon,
      isAnonymous,
      latitude,
      longitude,
      location);

  @override
  String toString() {
    return 'PostModel(id: $id, title: $title, content: $content, createdAt: $createdAt, author: $author, tags: $tags, icon: $icon, isAnonymous: $isAnonymous, latitude: $latitude, longitude: $longitude, location: $location)';
  }
}

/// @nodoc
abstract mixin class _$PostModelCopyWith<$Res>
    implements $PostModelCopyWith<$Res> {
  factory _$PostModelCopyWith(
          _PostModel value, $Res Function(_PostModel) _then) =
      __$PostModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String content,
      DateTime createdAt,
      UserModel author,
      List<TagsModel> tags,
      IconModel icon,
      bool isAnonymous,
      double latitude,
      double longitude,
      String location});

  @override
  $UserModelCopyWith<$Res> get author;
  @override
  $IconModelCopyWith<$Res> get icon;
}

/// @nodoc
class __$PostModelCopyWithImpl<$Res> implements _$PostModelCopyWith<$Res> {
  __$PostModelCopyWithImpl(this._self, this._then);

  final _PostModel _self;
  final $Res Function(_PostModel) _then;

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
    Object? createdAt = null,
    Object? author = null,
    Object? tags = null,
    Object? icon = null,
    Object? isAnonymous = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? location = null,
  }) {
    return _then(_PostModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      author: null == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as UserModel,
      tags: null == tags
          ? _self._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagsModel>,
      icon: null == icon
          ? _self.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconModel,
      isAnonymous: null == isAnonymous
          ? _self.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get author {
    return $UserModelCopyWith<$Res>(_self.author, (value) {
      return _then(_self.copyWith(author: value));
    });
  }

  /// Create a copy of PostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IconModelCopyWith<$Res> get icon {
    return $IconModelCopyWith<$Res>(_self.icon, (value) {
      return _then(_self.copyWith(icon: value));
    });
  }
}

// dart format on
