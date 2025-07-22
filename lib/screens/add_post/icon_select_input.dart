import 'package:SeeGestMobileApp/shared/styled_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IconSelectInput extends ConsumerStatefulWidget {
  const IconSelectInput({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IconSelectInputState();
}

class _IconSelectInputState extends ConsumerState<IconSelectInput> {
  

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyledInputLabelText("Ikonka posta"),
        const SizedBox(height: 4),
        
        // ListView.builder(itemBuilder: itemBuilder, itemCount: ,)
      ],
    );
  }
}
