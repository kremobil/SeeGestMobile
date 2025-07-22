import 'package:SeeGestMobileApp/screens/add_post/icon_select_input.dart';
import 'package:SeeGestMobileApp/shared/styled_input.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step1 extends ConsumerStatefulWidget {
  const Step1({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Step1State();
}

class _Step1State extends ConsumerState<Step1> {
  final GlobalKey<FormState> _addPostFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _addPostFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              StyledHeadingText("Stwórz post"),
              const SizedBox(
                height: 16,
              ),
              StyledFormInput(labelText: "Tytuł posta", hintText: "Wpisz tytuł"),
              const SizedBox(
                height: 16,
              ),
              IconSelectInput(),
              
            ],
          ),
        ),
      ),
    );
  }
}
