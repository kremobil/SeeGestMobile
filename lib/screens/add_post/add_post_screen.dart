import 'package:SeeGestMobileApp/screens/add_post/step1.dart';
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

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
        appBar: AppBar(
          leadingWidth: 156,
          leading: Container(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () {
                Navigator.of(context).pop(); // Navigate back
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
              const SizedBox(width: 8,),
              ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (Rect bounds) {
                    return AppColors.primaryGradient.createShader(bounds);
                  },
                  child: StyledHeadingText("Krok $step z 3")),
            ],
          ),
        ),
        body: AnimatedSwitcher(duration: Duration(microseconds: 300), child: switch (step) {
          1 => Step1(),
          int() => Placeholder(),
        },));
  }
}
