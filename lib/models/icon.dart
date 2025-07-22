import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:SeeGestMobileApp/models/file.dart';

part 'icon.freezed.dart';
part 'icon.g.dart';

@freezed
sealed class IconModel with _$IconModel {
  const factory IconModel(
      {required int id,
      required String name,
      required FileModel file}) = _IconModel;

  factory IconModel.fromJson(Map<String, dynamic> json) =>
      _$IconModelFromJson(json);
}