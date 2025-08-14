import 'package:SeeGestMobileApp/models/icon.dart';
import 'package:SeeGestMobileApp/models/tags.dart';
import 'package:SeeGestMobileApp/screens/add_post/step1.dart';
import 'package:SeeGestMobileApp/screens/add_post/step2.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/dashboard_layout.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  int step = 1;

  String? _title;
  String? _content;
  IconModel? _icon;
  List<TagsModel>? _tags;
  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
        selectedIndex: 1,
        appBar: AppBar(
          leadingWidth: 156,
          leading: Container(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () {
                if (step == 1) {
                  Navigator.of(context).pop(); // Navigate back
                } else {
                  setState(() {
                    step -= 1;
                  });
                }
              },
              label: ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) {
                    return AppColors.primaryGradient.createShader(bounds);
                  },
                  child: StyledHeadingText("Powrót")),
              icon: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return AppColors.primaryGradient.createShader(bounds);
                },
                child: const Icon(
                  FontAwesomeIcons.angleLeft,
                  size: 32,
                  color: AppColors.mainColor,
                ),
              ),
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return AppColors.primaryGradient.createShader(bounds);
                },
                child: const Icon(
                  FontAwesomeIcons.solidFlag,
                  size: 24,
                  color: AppColors.mainColor,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) {
                    return AppColors.primaryGradient.createShader(bounds);
                  },
                  child: StyledHeadingText("Krok $step z 3")),
            ],
          ),
        ),
        body: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          child: switch (step) {
            1 => Step1(
                onStepComplete: (title, content, icon, tags, date) {
                  setState(() {
                    _title = title;
                    _content = content;
                    _icon = icon;
                    _tags = tags;
                    _date = date;
                    step = 2;
                  });
                },
                initialTitle: _title,
                initialContent: _content,
                initialIcon: _icon,
                initialTags: _tags,
                initialDate: _date,
              ),
            2 => Step2(onStepComplete:
                  (double lat, double lng, String locationName) {
                return;
              }),
            int() => Placeholder(),
          },
        ));
  }
}
