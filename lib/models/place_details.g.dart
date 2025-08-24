// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaceDetailsModel _$PlaceDetailsModelFromJson(Map<String, dynamic> json) =>
    _PlaceDetailsModel(
      displayName: DisplayNameModel.fromJson(
          json['displayName'] as Map<String, dynamic>),
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlaceDetailsModelToJson(_PlaceDetailsModel instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'location': instance.location,
    };

_DisplayNameModel _$DisplayNameModelFromJson(Map<String, dynamic> json) =>
    _DisplayNameModel(
      languageCode: json['languageCode'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$DisplayNameModelToJson(_DisplayNameModel instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'text': instance.text,
    };

_LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    _LocationModel(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$LocationModelToJson(_LocationModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
