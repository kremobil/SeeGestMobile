// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FileModel {
  int get id;
  String get filename;
  String get mime_type;
  int get size;
  String get url;
  String get upload_date;

  /// Create a copy of FileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FileModelCopyWith<FileModel> get copyWith =>
      _$FileModelCopyWithImpl<FileModel>(this as FileModel, _$identity);

  /// Serializes this FileModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FileModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.mime_type, mime_type) ||
                other.mime_type == mime_type) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.upload_date, upload_date) ||
                other.upload_date == upload_date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, filename, mime_type, size, url, upload_date);

  @override
  String toString() {
    return 'FileModel(id: $id, filename: $filename, mime_type: $mime_type, size: $size, url: $url, upload_date: $upload_date)';
  }
}

/// @nodoc
abstract mixin class $FileModelCopyWith<$Res> {
  factory $FileModelCopyWith(FileModel value, $Res Function(FileModel) _then) =
      _$FileModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String filename,
      String mime_type,
      int size,
      String url,
      String upload_date});
}

/// @nodoc
class _$FileModelCopyWithImpl<$Res> implements $FileModelCopyWith<$Res> {
  _$FileModelCopyWithImpl(this._self, this._then);

  final FileModel _self;
  final $Res Function(FileModel) _then;

  /// Create a copy of FileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filename = null,
    Object? mime_type = null,
    Object? size = null,
    Object? url = null,
    Object? upload_date = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      filename: null == filename
          ? _self.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      mime_type: null == mime_type
          ? _self.mime_type
          : mime_type // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      upload_date: null == upload_date
          ? _self.upload_date
          : upload_date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FileModel implements FileModel {
  const _FileModel(
      {required this.id,
      required this.filename,
      required this.mime_type,
      required this.size,
      required this.url,
      required this.upload_date});
  factory _FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);

  @override
  final int id;
  @override
  final String filename;
  @override
  final String mime_type;
  @override
  final int size;
  @override
  final String url;
  @override
  final String upload_date;

  /// Create a copy of FileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FileModelCopyWith<_FileModel> get copyWith =>
      __$FileModelCopyWithImpl<_FileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FileModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FileModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.mime_type, mime_type) ||
                other.mime_type == mime_type) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.upload_date, upload_date) ||
                other.upload_date == upload_date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, filename, mime_type, size, url, upload_date);

  @override
  String toString() {
    return 'FileModel(id: $id, filename: $filename, mime_type: $mime_type, size: $size, url: $url, upload_date: $upload_date)';
  }
}

/// @nodoc
abstract mixin class _$FileModelCopyWith<$Res>
    implements $FileModelCopyWith<$Res> {
  factory _$FileModelCopyWith(
          _FileModel value, $Res Function(_FileModel) _then) =
      __$FileModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String filename,
      String mime_type,
      int size,
      String url,
      String upload_date});
}

/// @nodoc
class __$FileModelCopyWithImpl<$Res> implements _$FileModelCopyWith<$Res> {
  __$FileModelCopyWithImpl(this._self, this._then);

  final _FileModel _self;
  final $Res Function(_FileModel) _then;

  /// Create a copy of FileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? filename = null,
    Object? mime_type = null,
    Object? size = null,
    Object? url = null,
    Object? upload_date = null,
  }) {
    return _then(_FileModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      filename: null == filename
          ? _self.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String,
      mime_type: null == mime_type
          ? _self.mime_type
          : mime_type // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      upload_date: null == upload_date
          ? _self.upload_date
          : upload_date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
