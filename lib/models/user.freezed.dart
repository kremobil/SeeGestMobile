// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {
  int get id;
  String get name;
  String get surname;
  String get city;
  DateTime get birthdate;
  FileModel get avatar;
  List<PostModel> get posts;
  bool get isFacebookConnected;
  bool get isGoogleConnected;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality().equals(other.posts, posts) &&
            (identical(other.isFacebookConnected, isFacebookConnected) ||
                other.isFacebookConnected == isFacebookConnected) &&
            (identical(other.isGoogleConnected, isGoogleConnected) ||
                other.isGoogleConnected == isGoogleConnected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      surname,
      city,
      birthdate,
      avatar,
      const DeepCollectionEquality().hash(posts),
      isFacebookConnected,
      isGoogleConnected);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, surname: $surname, city: $city, birthdate: $birthdate, avatar: $avatar, posts: $posts, isFacebookConnected: $isFacebookConnected, isGoogleConnected: $isGoogleConnected)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String surname,
      String city,
      DateTime birthdate,
      FileModel avatar,
      List<PostModel> posts,
      bool isFacebookConnected,
      bool isGoogleConnected});

  $FileModelCopyWith<$Res> get avatar;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? surname = null,
    Object? city = null,
    Object? birthdate = null,
    Object? avatar = null,
    Object? posts = null,
    Object? isFacebookConnected = null,
    Object? isGoogleConnected = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _self.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: null == birthdate
          ? _self.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      avatar: null == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as FileModel,
      posts: null == posts
          ? _self.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostModel>,
      isFacebookConnected: null == isFacebookConnected
          ? _self.isFacebookConnected
          : isFacebookConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isGoogleConnected: null == isGoogleConnected
          ? _self.isGoogleConnected
          : isGoogleConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FileModelCopyWith<$Res> get avatar {
    return $FileModelCopyWith<$Res>(_self.avatar, (value) {
      return _then(_self.copyWith(avatar: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _UserModel implements UserModel {
  const _UserModel(
      {required this.id,
      required this.name,
      required this.surname,
      required this.city,
      required this.birthdate,
      required this.avatar,
      required final List<PostModel> posts,
      required this.isFacebookConnected,
      required this.isGoogleConnected})
      : _posts = posts;
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String surname;
  @override
  final String city;
  @override
  final DateTime birthdate;
  @override
  final FileModel avatar;
  final List<PostModel> _posts;
  @override
  List<PostModel> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  final bool isFacebookConnected;
  @override
  final bool isGoogleConnected;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.surname, surname) || other.surname == surname) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.birthdate, birthdate) ||
                other.birthdate == birthdate) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.isFacebookConnected, isFacebookConnected) ||
                other.isFacebookConnected == isFacebookConnected) &&
            (identical(other.isGoogleConnected, isGoogleConnected) ||
                other.isGoogleConnected == isGoogleConnected));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      surname,
      city,
      birthdate,
      avatar,
      const DeepCollectionEquality().hash(_posts),
      isFacebookConnected,
      isGoogleConnected);

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, surname: $surname, city: $city, birthdate: $birthdate, avatar: $avatar, posts: $posts, isFacebookConnected: $isFacebookConnected, isGoogleConnected: $isGoogleConnected)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) _then) =
      __$UserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String surname,
      String city,
      DateTime birthdate,
      FileModel avatar,
      List<PostModel> posts,
      bool isFacebookConnected,
      bool isGoogleConnected});

  @override
  $FileModelCopyWith<$Res> get avatar;
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? surname = null,
    Object? city = null,
    Object? birthdate = null,
    Object? avatar = null,
    Object? posts = null,
    Object? isFacebookConnected = null,
    Object? isGoogleConnected = null,
  }) {
    return _then(_UserModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: null == surname
          ? _self.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: null == birthdate
          ? _self.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      avatar: null == avatar
          ? _self.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as FileModel,
      posts: null == posts
          ? _self._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostModel>,
      isFacebookConnected: null == isFacebookConnected
          ? _self.isFacebookConnected
          : isFacebookConnected // ignore: cast_nullable_to_non_nullable
              as bool,
      isGoogleConnected: null == isGoogleConnected
          ? _self.isGoogleConnected
          : isGoogleConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FileModelCopyWith<$Res> get avatar {
    return $FileModelCopyWith<$Res>(_self.avatar, (value) {
      return _then(_self.copyWith(avatar: value));
    });
  }
}

// dart format on
