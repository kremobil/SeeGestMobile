// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'icon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IconModel _$IconModelFromJson(Map<String, dynamic> json) => _IconModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      file: FileModel.fromJson(json['file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IconModelToJson(_IconModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'file': instance.file,
    };
