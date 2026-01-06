import 'package:SeeGestMobileApp/models/file.dart';
import 'package:SeeGestMobileApp/models/post.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
sealed class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String name,
    required String surname,
    required String city,
    required DateTime birthdate,
    required FileModel avatar,
    required List<PostModel> posts,
    required bool isFacebookConnected,
    required bool isGoogleConnected,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

@freezed
sealed class PlainUserModel with _$PlainUserModel {
  const factory PlainUserModel({
    required String name,
    required FileModel avatar,
  }) = _PlainUserModel;

  factory PlainUserModel.fromJson(Map<String, dynamic> json) => _$PlainUserModelFromJson(json);
}
