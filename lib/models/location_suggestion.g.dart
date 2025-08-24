// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_suggestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationSuggestionModel _$LocationSuggestionModelFromJson(
        Map<String, dynamic> json) =>
    _LocationSuggestionModel(
      placeId: json['placeId'] as String,
      structuredFormat: StructuredFormatModel.fromJson(
          json['structuredFormat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LocationSuggestionModelToJson(
        _LocationSuggestionModel instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'structuredFormat': instance.structuredFormat,
    };

_TextInfoModel _$TextInfoModelFromJson(Map<String, dynamic> json) =>
    _TextInfoModel(
      text: json['text'] as String,
    );

Map<String, dynamic> _$TextInfoModelToJson(_TextInfoModel instance) =>
    <String, dynamic>{
      'text': instance.text,
    };

_StructuredFormatModel _$StructuredFormatModelFromJson(
        Map<String, dynamic> json) =>
    _StructuredFormatModel(
      mainText:
          TextInfoModel.fromJson(json['mainText'] as Map<String, dynamic>),
      secondaryText:
          TextInfoModel.fromJson(json['secondaryText'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StructuredFormatModelToJson(
        _StructuredFormatModel instance) =>
    <String, dynamic>{
      'mainText': instance.mainText,
      'secondaryText': instance.secondaryText,
    };
