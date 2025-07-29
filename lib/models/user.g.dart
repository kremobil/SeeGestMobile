// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      surname: json['surname'] as String,
      city: json['city'] as String,
      birthdate: DateTime.parse(json['birthdate'] as String),
      avatar: FileModel.fromJson(json['avatar'] as Map<String, dynamic>),
      posts: (json['posts'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFacebookConnected: json['isFacebookConnected'] as bool,
      isGoogleConnected: json['isGoogleConnected'] as bool,
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'city': instance.city,
      'birthdate': instance.birthdate.toIso8601String(),
      'avatar': instance.avatar,
      'posts': instance.posts,
      'isFacebookConnected': instance.isFacebookConnected,
      'isGoogleConnected': instance.isGoogleConnected,
    };
