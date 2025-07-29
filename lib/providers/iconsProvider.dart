import 'dart:convert';

import 'package:SeeGestMobileApp/models/file.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:SeeGestMobileApp/models/icon.dart';

import 'package:http/http.dart' as http;

part 'iconsProvider.g.dart';

@riverpod
Future<List<IconModel>> icons(Ref ref) async {
  http.Response response = await http.get(
    Uri.parse('https://api.seegest.com/icons'),
  );

  if (response.statusCode == 200) {
    List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;

    return jsonList.map((json) => IconModel.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load icons');
  }
}
