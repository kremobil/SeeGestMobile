// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceDetailsModel {
  DisplayNameModel get displayName;
  LocationModel get location;

  /// Create a copy of PlaceDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaceDetailsModelCopyWith<PlaceDetailsModel> get copyWith =>
      _$PlaceDetailsModelCopyWithImpl<PlaceDetailsModel>(
          this as PlaceDetailsModel, _$identity);

  /// Serializes this PlaceDetailsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaceDetailsModel &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, displayName, location);

  @override
  String toString() {
    return 'PlaceDetailsModel(displayName: $displayName, location: $location)';
  }
}

/// @nodoc
abstract mixin class $PlaceDetailsModelCopyWith<$Res> {
  factory $PlaceDetailsModelCopyWith(
          PlaceDetailsModel value, $Res Function(PlaceDetailsModel) _then) =
      _$PlaceDetailsModelCopyWithImpl;
  @useResult
  $Res call({DisplayNameModel displayName, LocationModel location});

  $DisplayNameModelCopyWith<$Res> get displayName;
  $LocationModelCopyWith<$Res> get location;
}

/// @nodoc
class _$PlaceDetailsModelCopyWithImpl<$Res>
    implements $PlaceDetailsModelCopyWith<$Res> {
  _$PlaceDetailsModelCopyWithImpl(this._self, this._then);

  final PlaceDetailsModel _self;
  final $Res Function(PlaceDetailsModel) _then;

  /// Create a copy of PlaceDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? location = null,
  }) {
    return _then(_self.copyWith(
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as DisplayNameModel,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel,
    ));
  }

  /// Create a copy of PlaceDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DisplayNameModelCopyWith<$Res> get displayName {
    return $DisplayNameModelCopyWith<$Res>(_self.displayName, (value) {
      return _then(_self.copyWith(displayName: value));
    });
  }

  /// Create a copy of PlaceDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res> get location {
    return $LocationModelCopyWith<$Res>(_self.location, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _PlaceDetailsModel extends PlaceDetailsModel {
  const _PlaceDetailsModel({required this.displayName, required this.location})
      : super._();
  factory _PlaceDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsModelFromJson(json);

  @override
  final DisplayNameModel displayName;
  @override
  final LocationModel location;

  /// Create a copy of PlaceDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaceDetailsModelCopyWith<_PlaceDetailsModel> get copyWith =>
      __$PlaceDetailsModelCopyWithImpl<_PlaceDetailsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PlaceDetailsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaceDetailsModel &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, displayName, location);

  @override
  String toString() {
    return 'PlaceDetailsModel(displayName: $displayName, location: $location)';
  }
}

/// @nodoc
abstract mixin class _$PlaceDetailsModelCopyWith<$Res>
    implements $PlaceDetailsModelCopyWith<$Res> {
  factory _$PlaceDetailsModelCopyWith(
          _PlaceDetailsModel value, $Res Function(_PlaceDetailsModel) _then) =
      __$PlaceDetailsModelCopyWithImpl;
  @override
  @useResult
  $Res call({DisplayNameModel displayName, LocationModel location});

  @override
  $DisplayNameModelCopyWith<$Res> get displayName;
  @override
  $LocationModelCopyWith<$Res> get location;
}

/// @nodoc
class __$PlaceDetailsModelCopyWithImpl<$Res>
    implements _$PlaceDetailsModelCopyWith<$Res> {
  __$PlaceDetailsModelCopyWithImpl(this._self, this._then);

  final _PlaceDetailsModel _self;
  final $Res Function(_PlaceDetailsModel) _then;

  /// Create a copy of PlaceDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? displayName = null,
    Object? location = null,
  }) {
    return _then(_PlaceDetailsModel(
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as DisplayNameModel,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel,
    ));
  }

  /// Create a copy of PlaceDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DisplayNameModelCopyWith<$Res> get displayName {
    return $DisplayNameModelCopyWith<$Res>(_self.displayName, (value) {
      return _then(_self.copyWith(displayName: value));
    });
  }

  /// Create a copy of PlaceDetailsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res> get location {
    return $LocationModelCopyWith<$Res>(_self.location, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}

/// @nodoc
mixin _$DisplayNameModel {
  String get languageCode;
  String get text;

  /// Create a copy of DisplayNameModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DisplayNameModelCopyWith<DisplayNameModel> get copyWith =>
      _$DisplayNameModelCopyWithImpl<DisplayNameModel>(
          this as DisplayNameModel, _$identity);

  /// Serializes this DisplayNameModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DisplayNameModel &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, languageCode, text);

  @override
  String toString() {
    return 'DisplayNameModel(languageCode: $languageCode, text: $text)';
  }
}

/// @nodoc
abstract mixin class $DisplayNameModelCopyWith<$Res> {
  factory $DisplayNameModelCopyWith(
          DisplayNameModel value, $Res Function(DisplayNameModel) _then) =
      _$DisplayNameModelCopyWithImpl;
  @useResult
  $Res call({String languageCode, String text});
}

/// @nodoc
class _$DisplayNameModelCopyWithImpl<$Res>
    implements $DisplayNameModelCopyWith<$Res> {
  _$DisplayNameModelCopyWithImpl(this._self, this._then);

  final DisplayNameModel _self;
  final $Res Function(DisplayNameModel) _then;

  /// Create a copy of DisplayNameModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? languageCode = null,
    Object? text = null,
  }) {
    return _then(_self.copyWith(
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DisplayNameModel extends DisplayNameModel {
  const _DisplayNameModel({required this.languageCode, required this.text})
      : super._();
  factory _DisplayNameModel.fromJson(Map<String, dynamic> json) =>
      _$DisplayNameModelFromJson(json);

  @override
  final String languageCode;
  @override
  final String text;

  /// Create a copy of DisplayNameModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DisplayNameModelCopyWith<_DisplayNameModel> get copyWith =>
      __$DisplayNameModelCopyWithImpl<_DisplayNameModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DisplayNameModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DisplayNameModel &&
            (identical(other.languageCode, languageCode) ||
                other.languageCode == languageCode) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, languageCode, text);

  @override
  String toString() {
    return 'DisplayNameModel(languageCode: $languageCode, text: $text)';
  }
}

/// @nodoc
abstract mixin class _$DisplayNameModelCopyWith<$Res>
    implements $DisplayNameModelCopyWith<$Res> {
  factory _$DisplayNameModelCopyWith(
          _DisplayNameModel value, $Res Function(_DisplayNameModel) _then) =
      __$DisplayNameModelCopyWithImpl;
  @override
  @useResult
  $Res call({String languageCode, String text});
}

/// @nodoc
class __$DisplayNameModelCopyWithImpl<$Res>
    implements _$DisplayNameModelCopyWith<$Res> {
  __$DisplayNameModelCopyWithImpl(this._self, this._then);

  final _DisplayNameModel _self;
  final $Res Function(_DisplayNameModel) _then;

  /// Create a copy of DisplayNameModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? languageCode = null,
    Object? text = null,
  }) {
    return _then(_DisplayNameModel(
      languageCode: null == languageCode
          ? _self.languageCode
          : languageCode // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _self.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$LocationModel {
  double get latitude;
  double get longitude;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<LocationModel> get copyWith =>
      _$LocationModelCopyWithImpl<LocationModel>(
          this as LocationModel, _$identity);

  /// Serializes this LocationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationModel &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @override
  String toString() {
    return 'LocationModel(latitude: $latitude, longitude: $longitude)';
  }
}

/// @nodoc
abstract mixin class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
          LocationModel value, $Res Function(LocationModel) _then) =
      _$LocationModelCopyWithImpl;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._self, this._then);

  final LocationModel _self;
  final $Res Function(LocationModel) _then;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_self.copyWith(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LocationModel extends LocationModel {
  const _LocationModel({required this.latitude, required this.longitude})
      : super._();
  factory _LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  @override
  final double latitude;
  @override
  final double longitude;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationModelCopyWith<_LocationModel> get copyWith =>
      __$LocationModelCopyWithImpl<_LocationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationModel &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @override
  String toString() {
    return 'LocationModel(latitude: $latitude, longitude: $longitude)';
  }
}

/// @nodoc
abstract mixin class _$LocationModelCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$LocationModelCopyWith(
          _LocationModel value, $Res Function(_LocationModel) _then) =
      __$LocationModelCopyWithImpl;
  @override
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$LocationModelCopyWithImpl<$Res>
    implements _$LocationModelCopyWith<$Res> {
  __$LocationModelCopyWithImpl(this._self, this._then);

  final _LocationModel _self;
  final $Res Function(_LocationModel) _then;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_LocationModel(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
