import 'package:SeeGestMobileApp/controllers/location_controller.dart';
import 'package:SeeGestMobileApp/models/place_details.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'placeDetailsProvider.g.dart';

@riverpod
Future<PlaceDetailsModel> placeDetails (Ref ref, {required String placeId}) async {
  PlaceDetailsModel details = await LocationController.getPlaceDetails(placeId);

  return details;
}