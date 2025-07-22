import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'iconsProvider.g.dart';

@riverpod
class Icons extends _$Icons {
  @override
  Future<List<int>> build() async {
    return Future(() => [1, 4, 5]);
  }
}