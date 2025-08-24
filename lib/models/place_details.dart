import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_details.freezed.dart';
part 'place_details.g.dart';

@freezed
sealed class PlaceDetailsModel with _$PlaceDetailsModel {
  const PlaceDetailsModel._(); // Dla custom methods
  
  const factory PlaceDetailsModel({
    required DisplayNameModel displayName,
    required LocationModel location,
  }) = _PlaceDetailsModel;

  factory PlaceDetailsModel.fromJson(Map<String, dynamic> json) => 
      _$PlaceDetailsModelFromJson(json);
      
}

@freezed
sealed class DisplayNameModel with _$DisplayNameModel {
  const DisplayNameModel._(); // Dla custom methods
  
  const factory DisplayNameModel({
    required String languageCode,
    required String text,
  }) = _DisplayNameModel;

  factory DisplayNameModel.fromJson(Map<String, dynamic> json) => 
      _$DisplayNameModelFromJson(json);
      
}


@freezed
sealed class LocationModel with _$LocationModel {
  const LocationModel._(); // Dla custom methods
  
  const factory LocationModel({
    required double latitude,
    required double longitude,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) => 
      _$LocationModelFromJson(json);
      
}
