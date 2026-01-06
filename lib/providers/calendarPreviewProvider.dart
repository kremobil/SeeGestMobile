import 'dart:convert';

import 'package:SeeGestMobileApp/controllers/location_controller.dart';
import 'package:SeeGestMobileApp/models/location_suggestion.dart';
import 'package:SeeGestMobileApp/models/tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendarPreviewProvider.g.dart';

@riverpod
Future<List<DateTime>> calendarPreview(
  Ref ref, {
  TimeOfDay? fromTime,
  TimeOfDay? toTime,
  List<TagsModel>? tags,
  required int month,
  required int year,
}) async {
  print("Fetching calendar preview with parameters:");
  Map<String, dynamic> body = {
    if (fromTime != null) "start_time": "${fromTime.hour}:${fromTime.minute}",
    if (toTime != null) "end_time": "${toTime.hour}:${toTime.minute}",
    if (tags != null && tags.isNotEmpty)
      "tags_ids": tags.map((tag) => tag.id).toList(),
    "month": month,
    "year": year,
    "offset": 1,
  };

  http.Response response = await http.post(
    Uri.parse('https://api.seegest.com/calendar-preview'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(body),
  );

  final Map<String, dynamic> responseData = jsonDecode(response.body);

  if (response.statusCode == 200 && !responseData.containsKey("error")) {
    if (responseData['meta']['total_posts'] == 0) return [];

    List<DateTime> availableDates = (responseData['dates'] as Map<String, dynamic>).keys
        .map((dateString) {
          DateTime parsedDate = DateTime.parse(dateString);
          return DateTime(parsedDate.year, parsedDate.month, parsedDate.day);
        })
        .toList();

    print("Available dates fetched: $availableDates");

    return availableDates;
  }

  print("Encountered an error: $responseData");

  return [];
}