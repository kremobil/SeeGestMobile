import 'package:freezed_annotation/freezed_annotation.dart';

part 'file.freezed.dart';
part 'file.g.dart';

@freezed
sealed class FileModel with _$FileModel {
  const factory FileModel({
    required int id,
    required String filename,
    required String mime_type,
    required int size,
    required String url,
    required String upload_date,
  }) = _FileModel;

  factory FileModel.fromJson(Map<String, dynamic> json) =>
      _$FileModelFromJson(json);
}
