import 'package:SeeGestMobileApp/classes/user.dart';
import 'package:SeeGestMobileApp/providers/profileProvider.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomepageAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const HomepageAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

  final AsyncValue<User> futureUser = ref.watch(profileProvider);

    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          futureUser.when(
            data: (user) {
              String _headerGreeting = 'Cześć ${user.name}!';
              String _avatarUrl = user.avatarUrl ?? '';
              return GestureDetector(
                child: Row(
                  children: <Widget>[
                    Hero(
                      tag: 'avatar',
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(_avatarUrl),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _headerGreeting,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/profile', // Navigate to the profile page
                  );
                },
              );
            },
            error: (error, _) => const Text('Error loading user data'),
            loading: () => const CircularProgressIndicator(),
          ),
          IconButton(
            icon: const Icon(Icons.notifications_active_outlined), // Ring icon
            iconSize: 36.0, // Set the icon size
            color: Colors.white, // Set the icon color to white
            onPressed: () {
              // Define the action when the ring icon is pressed
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}