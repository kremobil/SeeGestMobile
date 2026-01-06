import 'package:SeeGestMobileApp/models/post.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/dashboard_layout.dart';
import 'package:SeeGestMobileApp/shared/post_card.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchPostsScreen extends ConsumerWidget {
  const SearchPostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as List<PostModel>;

    print(args);

    return DashboardLayout(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  style: FilledButton.styleFrom(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                    backgroundColor: AppColors.whiteColor,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  icon: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                    child: Icon(FontAwesomeIcons.chevronLeft, size: 24,)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: ShaderMask(
                    blendMode: BlendMode.srcIn,
                    shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                    child: StyledHeadingText('Powrót')),
                ),
              ),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                itemCount: args.length,
                itemBuilder: (context, index) {
                  final post = args[index];
                  return PostCard(post: post);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
} 
