// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tags.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TagsModel _$TagsModelFromJson(Map<String, dynamic> json) => _TagsModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$TagsModelToJson(_TagsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'count': instance.count,
    };
