import 'package:SeeGestMobileApp/models/post.dart';
import 'package:SeeGestMobileApp/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
sealed class PlainCommentModel with _$PlainCommentModel {
  const factory PlainCommentModel({
    required int id,
    required String content,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required int depth,
    @JsonKey(name: 'is_anonymous') required bool isAnonymous
  }) = _PlainCommentModel;

  factory PlainCommentModel.fromJson(Map<String, dynamic> json) => _$PlainCommentModelFromJson(json);
}

@freezed
sealed class CommentModel with _$CommentModel {
  const factory CommentModel({
    required int id,
    required String content,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    required UserModel author,
    required PostModel post,
    @JsonKey(name: 'parent_comment') required PlainCommentModel parentComment,
    required List<CommentModel> replies,
    required int depth,
    @JsonKey(name: 'is_anonymous') required bool isAnonymous,
    required String path,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
}
