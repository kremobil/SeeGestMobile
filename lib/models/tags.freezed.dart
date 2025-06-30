// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tags.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TagsModel {
  int get id;
  String get name;
  int get count;

  /// Create a copy of TagsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TagsModelCopyWith<TagsModel> get copyWith =>
      _$TagsModelCopyWithImpl<TagsModel>(this as TagsModel, _$identity);

  /// Serializes this TagsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TagsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, count);

  @override
  String toString() {
    return 'TagsModel(id: $id, name: $name, count: $count)';
  }
}

/// @nodoc
abstract mixin class $TagsModelCopyWith<$Res> {
  factory $TagsModelCopyWith(TagsModel value, $Res Function(TagsModel) _then) =
      _$TagsModelCopyWithImpl;
  @useResult
  $Res call({int id, String name, int count});
}

/// @nodoc
class _$TagsModelCopyWithImpl<$Res> implements $TagsModelCopyWith<$Res> {
  _$TagsModelCopyWithImpl(this._self, this._then);

  final TagsModel _self;
  final $Res Function(TagsModel) _then;

  /// Create a copy of TagsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? count = null,
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
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TagsModel implements TagsModel {
  const _TagsModel({required this.id, required this.name, required this.count});
  factory _TagsModel.fromJson(Map<String, dynamic> json) =>
      _$TagsModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int count;

  /// Create a copy of TagsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TagsModelCopyWith<_TagsModel> get copyWith =>
      __$TagsModelCopyWithImpl<_TagsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TagsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TagsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, count);

  @override
  String toString() {
    return 'TagsModel(id: $id, name: $name, count: $count)';
  }
}

/// @nodoc
abstract mixin class _$TagsModelCopyWith<$Res>
    implements $TagsModelCopyWith<$Res> {
  factory _$TagsModelCopyWith(
          _TagsModel value, $Res Function(_TagsModel) _then) =
      __$TagsModelCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, int count});
}

/// @nodoc
class __$TagsModelCopyWithImpl<$Res> implements _$TagsModelCopyWith<$Res> {
  __$TagsModelCopyWithImpl(this._self, this._then);

  final _TagsModel _self;
  final $Res Function(_TagsModel) _then;

  /// Create a copy of TagsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? count = null,
  }) {
    return _then(_TagsModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _self.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
