import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPosts extends ConsumerWidget {
  const MyPosts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Text("Moej posty"),
    );
  }
}