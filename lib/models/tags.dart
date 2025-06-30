import 'package:freezed_annotation/freezed_annotation.dart';

part 'tags.freezed.dart';
part 'tags.g.dart';

@freezed
sealed class TagsModel with _$TagsModel {
  const factory TagsModel({
    required int id,
    required String name,
    required int count,
  }) = _TagsModel;

  factory TagsModel.fromJson(Map<String, dynamic> json) => _$TagsModelFromJson(json);
}