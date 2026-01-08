// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocationSuggestionModel {
  String get placeId;
  StructuredFormatModel get structuredFormat;

  /// Create a copy of LocationSuggestionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationSuggestionModelCopyWith<LocationSuggestionModel> get copyWith =>
      _$LocationSuggestionModelCopyWithImpl<LocationSuggestionModel>(
          this as LocationSuggestionModel, _$identity);

  /// Serializes this LocationSuggestionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationSuggestionModel &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.structuredFormat, structuredFormat) ||
                other.structuredFormat == structuredFormat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, placeId, structuredFormat);

  @override
  String toString() {
    return 'LocationSuggestionModel(placeId: $placeId, structuredFormat: $structuredFormat)';
  }
}

/// @nodoc
abstract mixin class $LocationSuggestionModelCopyWith<$Res> {
  factory $LocationSuggestionModelCopyWith(LocationSuggestionModel value,
          $Res Function(LocationSuggestionModel) _then) =
      _$LocationSuggestionModelCopyWithImpl;
  @useResult
  $Res call({String placeId, StructuredFormatModel structuredFormat});

  $StructuredFormatModelCopyWith<$Res> get structuredFormat;
}

/// @nodoc
class _$LocationSuggestionModelCopyWithImpl<$Res>
    implements $LocationSuggestionModelCopyWith<$Res> {
  _$LocationSuggestionModelCopyWithImpl(this._self, this._then);

  final LocationSuggestionModel _self;
  final $Res Function(LocationSuggestionModel) _then;

  /// Create a copy of LocationSuggestionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? structuredFormat = null,
  }) {
    return _then(_self.copyWith(
      placeId: null == placeId
          ? _self.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      structuredFormat: null == structuredFormat
          ? _self.structuredFormat
          : structuredFormat // ignore: cast_nullable_to_non_nullable
              as StructuredFormatModel,
    ));
  }

  /// Create a copy of LocationSuggestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructuredFormatModelCopyWith<$Res> get structuredFormat {
    return $StructuredFormatModelCopyWith<$Res>(_self.structuredFormat,
        (value) {
      return _then(_self.copyWith(structuredFormat: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _LocationSuggestionModel extends LocationSuggestionModel {
  const _LocationSuggestionModel(
      {required this.placeId, required this.structuredFormat})
      : super._();
  factory _LocationSuggestionModel.fromJson(Map<String, dynamic> json) =>
      _$LocationSuggestionModelFromJson(json);

  @override
  final String placeId;
  @override
  final StructuredFormatModel structuredFormat;

  /// Create a copy of LocationSuggestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationSuggestionModelCopyWith<_LocationSuggestionModel> get copyWith =>
      __$LocationSuggestionModelCopyWithImpl<_LocationSuggestionModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocationSuggestionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationSuggestionModel &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.structuredFormat, structuredFormat) ||
                other.structuredFormat == structuredFormat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, placeId, structuredFormat);

  @override
  String toString() {
    return 'LocationSuggestionModel(placeId: $placeId, structuredFormat: $structuredFormat)';
  }
}

/// @nodoc
abstract mixin class _$LocationSuggestionModelCopyWith<$Res>
    implements $LocationSuggestionModelCopyWith<$Res> {
  factory _$LocationSuggestionModelCopyWith(_LocationSuggestionModel value,
          $Res Function(_LocationSuggestionModel) _then) =
      __$LocationSuggestionModelCopyWithImpl;
  @override
  @useResult
  $Res call({String placeId, StructuredFormatModel structuredFormat});

  @override
  $StructuredFormatModelCopyWith<$Res> get structuredFormat;
}

/// @nodoc
class __$LocationSuggestionModelCopyWithImpl<$Res>
    implements _$LocationSuggestionModelCopyWith<$Res> {
  __$LocationSuggestionModelCopyWithImpl(this._self, this._then);

  final _LocationSuggestionModel _self;
  final $Res Function(_LocationSuggestionModel) _then;

  /// Create a copy of LocationSuggestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? placeId = null,
    Object? structuredFormat = null,
  }) {
    return _then(_LocationSuggestionModel(
      placeId: null == placeId
          ? _self.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      structuredFormat: null == structuredFormat
          ? _self.structuredFormat
          : structuredFormat // ignore: cast_nullable_to_non_nullable
              as StructuredFormatModel,
    ));
  }

  /// Create a copy of LocationSuggestionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StructuredFormatModelCopyWith<$Res> get structuredFormat {
    return $StructuredFormatModelCopyWith<$Res>(_self.structuredFormat,
        (value) {
      return _then(_self.copyWith(structuredFormat: value));
    });
  }
}

/// @nodoc
mixin _$TextInfoModel {
  String get text;

  /// Create a copy of TextInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TextInfoModelCopyWith<TextInfoModel> get copyWith =>
      _$TextInfoModelCopyWithImpl<TextInfoModel>(
          this as TextInfoModel, _$identity);

  /// Serializes this TextInfoModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TextInfoModel &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  @override
  String toString() {
    return 'TextInfoModel(text: $text)';
  }
}

/// @nodoc
abstract mixin class $TextInfoModelCopyWith<$Res> {
  factory $TextInfoModelCopyWith(
          TextInfoModel value, $Res Function(TextInfoModel) _then) =
      _$TextInfoModelCopyWithImpl;
  @useResult
  $Res call({String text});
}

/// @nodoc
class _$TextInfoModelCopyWithImpl<$Res>
    implements $TextInfoModelCopyWith<$Res> {
  _$TextInfoModelCopyWithImpl(this._self, this._then);

  final TextInfoModel _self;
  final $Res Function(TextInfoModel) _then;

  /// Create a copy of TextInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_self.copyWith(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _TextInfoModel implements TextInfoModel {
  const _TextInfoModel({required this.text});
  factory _TextInfoModel.fromJson(Map<String, dynamic> json) =>
      _$TextInfoModelFromJson(json);

  @override
  final String text;

  /// Create a copy of TextInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TextInfoModelCopyWith<_TextInfoModel> get copyWith =>
      __$TextInfoModelCopyWithImpl<_TextInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TextInfoModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TextInfoModel &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, text);

  @override
  String toString() {
    return 'TextInfoModel(text: $text)';
  }
}

/// @nodoc
abstract mixin class _$TextInfoModelCopyWith<$Res>
    implements $TextInfoModelCopyWith<$Res> {
  factory _$TextInfoModelCopyWith(
          _TextInfoModel value, $Res Function(_TextInfoModel) _then) =
      __$TextInfoModelCopyWithImpl;
  @override
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$TextInfoModelCopyWithImpl<$Res>
    implements _$TextInfoModelCopyWith<$Res> {
  __$TextInfoModelCopyWithImpl(this._self, this._then);

  final _TextInfoModel _self;
  final $Res Function(_TextInfoModel) _then;

  /// Create a copy of TextInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? text = null,
  }) {
    return _then(_TextInfoModel(
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$StructuredFormatModel {
  TextInfoModel? get mainText;
  TextInfoModel? get secondaryText;

  /// Create a copy of StructuredFormatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StructuredFormatModelCopyWith<StructuredFormatModel> get copyWith =>
      _$StructuredFormatModelCopyWithImpl<StructuredFormatModel>(
          this as StructuredFormatModel, _$identity);

  /// Serializes this StructuredFormatModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StructuredFormatModel &&
            (identical(other.mainText, mainText) ||
                other.mainText == mainText) &&
            (identical(other.secondaryText, secondaryText) ||
                other.secondaryText == secondaryText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mainText, secondaryText);

  @override
  String toString() {
    return 'StructuredFormatModel(mainText: $mainText, secondaryText: $secondaryText)';
  }
}

/// @nodoc
abstract mixin class $StructuredFormatModelCopyWith<$Res> {
  factory $StructuredFormatModelCopyWith(StructuredFormatModel value,
          $Res Function(StructuredFormatModel) _then) =
      _$StructuredFormatModelCopyWithImpl;
  @useResult
  $Res call({TextInfoModel? mainText, TextInfoModel? secondaryText});

  $TextInfoModelCopyWith<$Res>? get mainText;
  $TextInfoModelCopyWith<$Res>? get secondaryText;
}

/// @nodoc
class _$StructuredFormatModelCopyWithImpl<$Res>
    implements $StructuredFormatModelCopyWith<$Res> {
  _$StructuredFormatModelCopyWithImpl(this._self, this._then);

  final StructuredFormatModel _self;
  final $Res Function(StructuredFormatModel) _then;

  /// Create a copy of StructuredFormatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mainText = freezed,
    Object? secondaryText = freezed,
  }) {
    return _then(_self.copyWith(
      mainText: freezed == mainText
          ? _self.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as TextInfoModel?,
      secondaryText: freezed == secondaryText
          ? _self.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as TextInfoModel?,
    ));
  }

  /// Create a copy of StructuredFormatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TextInfoModelCopyWith<$Res>? get mainText {
    if (_self.mainText == null) {
      return null;
    }

    return $TextInfoModelCopyWith<$Res>(_self.mainText!, (value) {
      return _then(_self.copyWith(mainText: value));
    });
  }

  /// Create a copy of StructuredFormatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TextInfoModelCopyWith<$Res>? get secondaryText {
    if (_self.secondaryText == null) {
      return null;
    }

    return $TextInfoModelCopyWith<$Res>(_self.secondaryText!, (value) {
      return _then(_self.copyWith(secondaryText: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _StructuredFormatModel implements StructuredFormatModel {
  const _StructuredFormatModel({this.mainText, this.secondaryText});
  factory _StructuredFormatModel.fromJson(Map<String, dynamic> json) =>
      _$StructuredFormatModelFromJson(json);

  @override
  final TextInfoModel? mainText;
  @override
  final TextInfoModel? secondaryText;

  /// Create a copy of StructuredFormatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StructuredFormatModelCopyWith<_StructuredFormatModel> get copyWith =>
      __$StructuredFormatModelCopyWithImpl<_StructuredFormatModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StructuredFormatModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StructuredFormatModel &&
            (identical(other.mainText, mainText) ||
                other.mainText == mainText) &&
            (identical(other.secondaryText, secondaryText) ||
                other.secondaryText == secondaryText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, mainText, secondaryText);

  @override
  String toString() {
    return 'StructuredFormatModel(mainText: $mainText, secondaryText: $secondaryText)';
  }
}

/// @nodoc
abstract mixin class _$StructuredFormatModelCopyWith<$Res>
    implements $StructuredFormatModelCopyWith<$Res> {
  factory _$StructuredFormatModelCopyWith(_StructuredFormatModel value,
          $Res Function(_StructuredFormatModel) _then) =
      __$StructuredFormatModelCopyWithImpl;
  @override
  @useResult
  $Res call({TextInfoModel? mainText, TextInfoModel? secondaryText});

  @override
  $TextInfoModelCopyWith<$Res>? get mainText;
  @override
  $TextInfoModelCopyWith<$Res>? get secondaryText;
}

/// @nodoc
class __$StructuredFormatModelCopyWithImpl<$Res>
    implements _$StructuredFormatModelCopyWith<$Res> {
  __$StructuredFormatModelCopyWithImpl(this._self, this._then);

  final _StructuredFormatModel _self;
  final $Res Function(_StructuredFormatModel) _then;

  /// Create a copy of StructuredFormatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mainText = freezed,
    Object? secondaryText = freezed,
  }) {
    return _then(_StructuredFormatModel(
      mainText: freezed == mainText
          ? _self.mainText
          : mainText // ignore: cast_nullable_to_non_nullable
              as TextInfoModel?,
      secondaryText: freezed == secondaryText
          ? _self.secondaryText
          : secondaryText // ignore: cast_nullable_to_non_nullable
              as TextInfoModel?,
    ));
  }

  /// Create a copy of StructuredFormatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TextInfoModelCopyWith<$Res>? get mainText {
    if (_self.mainText == null) {
      return null;
    }

    return $TextInfoModelCopyWith<$Res>(_self.mainText!, (value) {
      return _then(_self.copyWith(mainText: value));
    });
  }

  /// Create a copy of StructuredFormatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TextInfoModelCopyWith<$Res>? get secondaryText {
    if (_self.secondaryText == null) {
      return null;
    }

    return $TextInfoModelCopyWith<$Res>(_self.secondaryText!, (value) {
      return _then(_self.copyWith(secondaryText: value));
    });
  }
}

// dart format on
