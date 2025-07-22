// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'icon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IconModel {
  int get id;
  String get name;
  FileModel get file;

  /// Create a copy of IconModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IconModelCopyWith<IconModel> get copyWith =>
      _$IconModelCopyWithImpl<IconModel>(this as IconModel, _$identity);

  /// Serializes this IconModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IconModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.file, file) || other.file == file));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, file);

  @override
  String toString() {
    return 'IconModel(id: $id, name: $name, file: $file)';
  }
}

/// @nodoc
abstract mixin class $IconModelCopyWith<$Res> {
  factory $IconModelCopyWith(IconModel value, $Res Function(IconModel) _then) =
      _$IconModelCopyWithImpl;
  @useResult
  $Res call({int id, String name, FileModel file});

  $FileModelCopyWith<$Res> get file;
}

/// @nodoc
class _$IconModelCopyWithImpl<$Res> implements $IconModelCopyWith<$Res> {
  _$IconModelCopyWithImpl(this._self, this._then);

  final IconModel _self;
  final $Res Function(IconModel) _then;

  /// Create a copy of IconModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? file = null,
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
      file: null == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as FileModel,
    ));
  }

  /// Create a copy of IconModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FileModelCopyWith<$Res> get file {
    return $FileModelCopyWith<$Res>(_self.file, (value) {
      return _then(_self.copyWith(file: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _IconModel implements IconModel {
  const _IconModel({required this.id, required this.name, required this.file});
  factory _IconModel.fromJson(Map<String, dynamic> json) =>
      _$IconModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final FileModel file;

  /// Create a copy of IconModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IconModelCopyWith<_IconModel> get copyWith =>
      __$IconModelCopyWithImpl<_IconModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IconModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IconModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.file, file) || other.file == file));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, file);

  @override
  String toString() {
    return 'IconModel(id: $id, name: $name, file: $file)';
  }
}

/// @nodoc
abstract mixin class _$IconModelCopyWith<$Res>
    implements $IconModelCopyWith<$Res> {
  factory _$IconModelCopyWith(
          _IconModel value, $Res Function(_IconModel) _then) =
      __$IconModelCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String name, FileModel file});

  @override
  $FileModelCopyWith<$Res> get file;
}

/// @nodoc
class __$IconModelCopyWithImpl<$Res> implements _$IconModelCopyWith<$Res> {
  __$IconModelCopyWithImpl(this._self, this._then);

  final _IconModel _self;
  final $Res Function(_IconModel) _then;

  /// Create a copy of IconModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? file = null,
  }) {
    return _then(_IconModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      file: null == file
          ? _self.file
          : file // ignore: cast_nullable_to_non_nullable
              as FileModel,
    ));
  }

  /// Create a copy of IconModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FileModelCopyWith<$Res> get file {
    return $FileModelCopyWith<$Res>(_self.file, (value) {
      return _then(_self.copyWith(file: value));
    });
  }
}

// dart format on
