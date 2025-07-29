// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostModel _$PostModelFromJson(Map<String, dynamic> json) => _PostModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      content: json['content'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      author: UserModel.fromJson(json['author'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => TagsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      icon: IconModel.fromJson(json['icon'] as Map<String, dynamic>),
      isAnonymous: json['isAnonymous'] as bool,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      location: json['location'] as String,
    );

Map<String, dynamic> _$PostModelToJson(_PostModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt.toIso8601String(),
      'author': instance.author,
      'tags': instance.tags,
      'icon': instance.icon,
      'isAnonymous': instance.isAnonymous,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'location': instance.location,
    };
