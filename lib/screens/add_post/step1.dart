import 'package:SeeGestMobileApp/screens/add_post/add_post_calendar.dart';
import 'package:SeeGestMobileApp/screens/add_post/icon_select_input.dart';
import 'package:SeeGestMobileApp/shared/styled_input.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:SeeGestMobileApp/shared/tags_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Step1 extends ConsumerStatefulWidget {
  const Step1({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Step1State();
}

class _Step1State extends ConsumerState<Step1> {
  final GlobalKey<FormState> _addPostFormKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  // dynamic dropdown variables for tags input
  final GlobalKey<DynamicDropdownExpanderState> _dynamicDropdownKey =
      GlobalKey<DynamicDropdownExpanderState>();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _scrollableKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: _scrollableKey,
      controller: _scrollController,
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
              StyledFormInput(
                labelText: "Tytuł posta",
                hintText: "Wpisz tytuł",
                controller: _titleController,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Tytuł posta nie może być pusty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              IconSelectInput(
                onIconSelected: (icon) => print("Selected icon: ${icon.name}"),
              ),
              const SizedBox(
                height: 16,
              ),
              StyledFormInput(
                labelText: "Treść posta",
                hintText: "Wpisz treść",
                maxLines: 8,
                minLines: 5,
                keyboardType: TextInputType.multiline,
                controller: _contentController,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Treść posta nie może być pusta";
                  }
                  return null;
                },
              ),
              TagsInput(
                scrollableKey: _scrollableKey,
                dynamicExpanderKey: _dynamicDropdownKey,
                scrollController: _scrollController,
              ),
              const SizedBox(
                height: 16,
              ),
              AddPostCalendar(),
              DynamicDropdownExpander(
                key: _dynamicDropdownKey,
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
