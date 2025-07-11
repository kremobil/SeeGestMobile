import 'package:SeeGestMobileApp/classes/user.dart';
import 'package:SeeGestMobileApp/controllers/storage_controller.dart';
import 'package:SeeGestMobileApp/controllers/user_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:convert';
import 'package:SeeGestMobileApp/models/tags.dart';

part 'profileProvider.g.dart';

@riverpod
class Profile extends _$Profile {
  @override
  Future<User> build() async {

    final userData = await UserController.getUserData();

    return userData;
  }

  void fetchProfile() async {
    final userData = await UserController.getUserData();

    state = AsyncData(userData);
  }
}