// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlainCommentModel _$PlainCommentModelFromJson(Map<String, dynamic> json) =>
    _PlainCommentModel(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      depth: (json['depth'] as num).toInt(),
      isAnonymous: json['is_anonymous'] as bool,
    );

Map<String, dynamic> _$PlainCommentModelToJson(_PlainCommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'created_at': instance.createdAt.toIso8601String(),
      'depth': instance.depth,
      'is_anonymous': instance.isAnonymous,
    };

_CommentModel _$CommentModelFromJson(Map<String, dynamic> json) =>
    _CommentModel(
      id: (json['id'] as num).toInt(),
      content: json['content'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      author: UserModel.fromJson(json['author'] as Map<String, dynamic>),
      post: PostModel.fromJson(json['post'] as Map<String, dynamic>),
      parentComment: PlainCommentModel.fromJson(
          json['parent_comment'] as Map<String, dynamic>),
      replies: (json['replies'] as List<dynamic>)
          .map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      depth: (json['depth'] as num).toInt(),
      isAnonymous: json['is_anonymous'] as bool,
      path: json['path'] as String,
    );

Map<String, dynamic> _$CommentModelToJson(_CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'created_at': instance.createdAt.toIso8601String(),
      'author': instance.author,
      'post': instance.post,
      'parent_comment': instance.parentComment,
      'replies': instance.replies,
      'depth': instance.depth,
      'is_anonymous': instance.isAnonymous,
      'path': instance.path,
    };
