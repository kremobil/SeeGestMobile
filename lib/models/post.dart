import 'package:SeeGestMobileApp/models/icon.dart';
import 'package:SeeGestMobileApp/models/tags.dart';
import 'package:SeeGestMobileApp/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
sealed class PostModel with _$PostModel {
  const factory PostModel({
    required int id,
    required String title,
    required String content,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required PlainUserModel author,
    required List<TagsModel> tags,
    required IconModel icon,
    required double latitude,
    required double longitude,
    required String location,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}
