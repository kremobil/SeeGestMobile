import 'package:SeeGestMobileApp/classes/user.dart';
import 'package:SeeGestMobileApp/controllers/user_controller.dart';
import 'package:SeeGestMobileApp/providers/profileProvider.dart';
import 'package:SeeGestMobileApp/screens/profile/account_info.dart';
import 'package:SeeGestMobileApp/screens/profile/my_posts.dart';
import 'package:SeeGestMobileApp/screens/profile/switch_button.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/dashboard_layout.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final AsyncValue<User> futureUser = ref.watch(profileProvider);

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
                Icons.arrow_back_ios_new,
                size: 32,
                color: AppColors.mainColor,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Row(
              children: [
                futureUser.when(
                  data: (data) => Row(
                    children: <Widget>[
                      Hero(
                        tag: 'avatar',
                        child: Material(
                          color: Colors.transparent,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(data.avatarUrl ?? ''),
                            backgroundColor: Colors.transparent,
                            radius: 50,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (Rect bounds) {
                                return AppColors.primaryGradient
                                    .createShader(bounds);
                              },
                              child: StyledHeadingText(
                                  "${data?.name} ${data?.surname}")),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.cake_outlined,
                                    color: AppColors.secondaryColor,
                                  ),
                                  const SizedBox(width: 4),
                                  StyledSecondarySubheadingText(
                                      "${data?.birthdate}"),
                                ],
                              ),
                              const SizedBox(width: 16),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.apartment_outlined,
                                    color: AppColors.secondaryColor,
                                  ),
                                  const SizedBox(width: 4),
                                  StyledSecondarySubheadingText(
                                      "${data?.city}"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  error: (error, _) => const Text('Error loading user data'),
                  loading: () => const CircularProgressIndicator(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 16,
              children: [
                SwitchButton("Moje Posty", onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                }, active: _selectedIndex == 0),
                SwitchButton("Inoformacje o koncie", onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                }, active: _selectedIndex == 1),
              ],
            ),
            const Divider(
              color: AppColors.mainColor,
              thickness: 1,
            ),
            const SizedBox(height: 16),
            AnimatedSwitcher(duration: Duration(milliseconds: 500), 
            child: 
              _selectedIndex == 0 ? MyPosts() : AccountInfo()
            ,)
          ],
        ),
      )),
    );
  }
}
