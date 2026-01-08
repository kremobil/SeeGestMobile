import 'package:SeeGestMobileApp/controllers/location_controller.dart';
import 'package:SeeGestMobileApp/models/location_suggestion.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locationAutocompleteProvider.g.dart';

@riverpod
Future<List<LocationSuggestionModel>> locationAutocomplete(
  Ref ref, {
  required String query,
  required double latitude,
  required double longitude,
}) async {
  // Debounce to limit API calls
  await Future.delayed(const Duration(milliseconds: 300));


  if (query.trim() == "") return [];

  final List<LocationSuggestionModel> suggestions = await LocationController.getLocationAutocompleteSuggestions(query, lat: latitude, lng: longitude);
  
  return suggestions;
}