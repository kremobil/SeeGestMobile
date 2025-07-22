// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FileModel _$FileModelFromJson(Map<String, dynamic> json) => _FileModel(
      id: (json['id'] as num).toInt(),
      filename: json['filename'] as String,
      mime_type: json['mime_type'] as String,
      size: (json['size'] as num).toInt(),
      upload_date: json['upload_date'] as String,
    );

Map<String, dynamic> _$FileModelToJson(_FileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filename': instance.filename,
      'mime_type': instance.mime_type,
      'size': instance.size,
      'upload_date': instance.upload_date,
    };
