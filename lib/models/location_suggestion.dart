// location_models.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_suggestion.freezed.dart';
part 'location_suggestion.g.dart';

@freezed
sealed class LocationSuggestionModel with _$LocationSuggestionModel {
  const LocationSuggestionModel._(); // Dla custom methods
  
  const factory LocationSuggestionModel({
    required String placeId,
    required StructuredFormatModel structuredFormat,
  }) = _LocationSuggestionModel;

  factory LocationSuggestionModel.fromJson(Map<String, dynamic> json) => 
      _$LocationSuggestionModelFromJson(json);
      
}

@freezed
sealed class TextInfoModel with _$TextInfoModel {
  const factory TextInfoModel({
    required String text,
  }) = _TextInfoModel;

  factory TextInfoModel.fromJson(Map<String, dynamic> json) => 
      _$TextInfoModelFromJson(json);
}

@freezed
sealed class StructuredFormatModel with _$StructuredFormatModel {
  const factory StructuredFormatModel({
    required TextInfoModel mainText,
    TextInfoModel? secondaryText,  // Make this optional
  }) = _StructuredFormatModel;

  factory StructuredFormatModel.fromJson(Map<String, dynamic> json) => 
      _$StructuredFormatModelFromJson(json);
}