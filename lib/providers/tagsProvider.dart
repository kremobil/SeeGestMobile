import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:convert';
import 'package:SeeGestMobileApp/models/tags.dart';

part 'tagsProvider.g.dart';

@riverpod
class TagsSearch extends _$TagsSearch {
  @override
  Future<List<TagsModel>> build() async {
    return [];
  }

  Future<List<TagsModel>> search(String query, {List<TagsModel>? exclude}) async {
    if (query.isEmpty) {
      state = const AsyncData([]);
      return [];
    }

    Uri uri = Uri.parse('https://api.seegest.com/tags?query=$query');
    if (exclude != null && exclude.isNotEmpty) {
      uri = uri.replace(queryParameters: {
        ...uri.queryParameters,
        'exclude': exclude.map((tag) => tag.id.toString()).join(',')
      });
    }
    final response = await http.get(uri);

    final List<dynamic> data = json.decode(response.body);
    List<TagsModel> tags = data.map((tag) => TagsModel.fromJson(tag)).toList();

    state = AsyncData(tags);
    return tags;
  }

  Future<void> clear() async {
    state = const AsyncData([]);
  }

  Future<void> addTag(String name) async {
    if (state.valueOrNull?.any((tag) => tag.name == name) ?? false) {
      return; // Tag already exists
    }

    final response = await http.post(
      Uri.parse('https://api.seegest.com/tags'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'name': name}),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to add tag');
    }
  }
}