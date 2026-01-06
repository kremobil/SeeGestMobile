import 'package:SeeGestMobileApp/models/icon.dart';
import 'package:SeeGestMobileApp/models/tags.dart';
import 'package:SeeGestMobileApp/screens/add_post/add_post_calendar.dart';
import 'package:SeeGestMobileApp/screens/add_post/icon_select_input.dart';
import 'package:SeeGestMobileApp/shared/dynamic_dropdown_expander.dart';
import 'package:SeeGestMobileApp/shared/styled_button.dart';
import 'package:SeeGestMobileApp/shared/styled_input.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:SeeGestMobileApp/shared/tags_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Step1 extends ConsumerStatefulWidget {
  const Step1({
    super.key,
    required this.onStepComplete,
    this.initialTitle,
    this.initialContent,
    this.initialIcon,
    this.initialTags,
    this.initialDate,
  });

  final void Function(String title, String content, IconModel icon,
      List<TagsModel> tags, DateTime date) onStepComplete;

  final String? initialTitle;
  final String? initialContent;
  final IconModel? initialIcon;
  final List<TagsModel>? initialTags;
  final DateTime? initialDate;

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

  // form data
  IconModel? selectedIcon;
  List<TagsModel> selectedTags = [];
  DateTime selectedDatetime = DateTime.now();
  String get title => _titleController.text;
  String get content => _contentController.text;
  
  @override
  void initState() {
    super.initState();
    _titleController.text = widget.initialTitle ?? '';
    _contentController.text = widget.initialContent ?? '';
    selectedIcon = widget.initialIcon;
    selectedTags = widget.initialTags ?? [];
    selectedDatetime = widget.initialDate ?? DateTime.now();
  }

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
                onIconSelected: (icon) {
                  setState(() {
                    selectedIcon = icon;
                  });
                },
                initialIcon: widget.initialIcon,
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
                createNewTags: true,
                onTagsChanged: (List<TagsModel> tags) {
                  setState(() {
                    selectedTags = tags;
                  });
                },
                initialTags: widget.initialTags,
              ),
              const SizedBox(
                height: 16,
              ),
              AddPostCalendar(
                onDatetimeSelected: (datetime) {
                  setState(() {
                    selectedDatetime = datetime;
                  });
                },
                initialDate: widget.initialDate,
              ),
              const SizedBox(
                height: 16,
              ),
              StyledFilledButton(
                text: "Następny krok",
                callback: () {
                  if (_addPostFormKey.currentState?.validate() ?? false) {
                    if (selectedIcon == null) {
                      // Show an error message or handle the case when no icon is selected
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Proszę wybrać ikonę")),
                      );
                      return;
                    }

                    widget.onStepComplete(
                      title,
                      content,
                      selectedIcon!,
                      selectedTags,
                      selectedDatetime,
                    );
                  }
                },
                icon: FontAwesomeIcons.chevronRight,
              ),
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
