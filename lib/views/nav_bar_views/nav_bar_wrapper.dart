import 'dart:collection';

import 'package:SeeGestMobileApp/classes/colors.dart';
import 'package:SeeGestMobileApp/controllers/user_controller.dart';
import 'package:SeeGestMobileApp/classes/user.dart';
import 'package:SeeGestMobileApp/main.dart';
import 'package:SeeGestMobileApp/views/nav_bar_views/add_post.dart';
import 'package:SeeGestMobileApp/views/nav_bar_views/homepage_founded_posts.dart';
import 'package:SeeGestMobileApp/views/nav_bar_views/map_view.dart';
import 'package:SeeGestMobileApp/widgets/homepage_calendar.dart';
import 'package:SeeGestMobileApp/widgets/monthly_calendar_old.dart';
import 'package:SeeGestMobileApp/widgets/post.dart';
import 'package:SeeGestMobileApp/widgets/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Widget? _selectedPage = HomePage();
  late Future<User> futureUser;

  void _onItemTapped(int index) async {
    Widget? selectedPage = getSelectedPage(index);
    if (selectedPage != null) {
      setState(() {
          _selectedPage = selectedPage;
          _selectedIndex = index;
        }
      );
    }
  }

  Future<void> _launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget? getSelectedPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const AddPost();
      case 2:
        return const MapSearchView();
      case 3:
        _launchInBrowserView(
            Uri.parse('https://seegest.com')); // Replace with your help URL
        return null; // Replace with your help URL
      default:
        return const HomePage();
    }
  }

  @override
  void initState() {
    super.initState();
    
    futureUser = UserController.getUserData(); // Fetch user data when the widget is initialized`
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FutureBuilder<User>(future: futureUser, builder: (context, snapshot) {
              print(snapshot);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return const Text('Error loading user data');
              } else if (snapshot.hasData) {
                User? user = snapshot.data;
                String _headerGreeting = 'Cześć ${user?.name}!';
                String _avatarUrl = user?.avatarUrl ?? '';
                return Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(_avatarUrl),
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _headerGreeting,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                );
              } else {
                return const Text('No user data available');
              }
            }),
            IconButton(
              icon:
                  const Icon(Icons.notifications_active_outlined), // Ring icon
              iconSize: 36.0, // Set the icon size
              color: Colors.white, // Set the icon color to white
              onPressed: () {
                // Define the action when the ring icon is pressed
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 24.0), // Add horizontal padding
        child: SingleChildScrollView(
          child: Column(
            children: [
              TimePickerWidget(), // Add the TimePickerWidget
              const SizedBox(
                  height: 32), // Add space between time picker and calendar
              HomepageCalendar(),
            ],
          ),
        ),
      ),
      // body: Padding(
      //     padding: const EdgeInsets.symmetric(
      //         horizontal: 6.0), // Add horizontal padding
      //     child: HomepageFoundedPosts(
      //       posts: [
      //         PostWidget(
      //             profileImageUrl: 'aaaa',
      //             userName: 'aaaa',
      //             time: '21:37',
      //             title: 'tytuł',
      //             location: 'bromberg',
      //             content: 'serfgvjshrdjkvsdfvbsfd',
      //             tags: ['tag1', 'tag2']),
      //         PostWidget(
      //             profileImageUrl: 'aaaa',
      //             userName: 'aaaa',
      //             time: '21:37',
      //             title: 'tytuł',
      //             location: 'bromberg',
      //             content: 'serfghjrsfthgeuiagvjshrdjkvsdfvbsfd',
      //             tags: ['tag1', 'tag2']),
      //       ],
      //     ),),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          backgroundColor:
              Colors.transparent, // Set the background color to transparent
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.calendar_month, 0),
              label: 'Strona głowna',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.add, 1),
              label: 'Dodaj',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.map, 2),
              label: 'Mapa',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.help_outline, 3),
              label: 'Pomoc',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor:
              Colors.white, // Set the selected item color to white
          unselectedItemColor:
              Colors.white, // Set the unselected item color to white
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  Widget _buildIcon(IconData iconData, int index) {
    return Container(
      decoration: BoxDecoration(
        color: _selectedIndex == index
            ? const Color(0xFF162968)
            : Colors.transparent, // Blue background for selected item
        borderRadius: BorderRadius.circular(32.0), // Rounded corners
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 16.0, vertical: 4.0), // Padding around the icon
      child: Icon(
        iconData,
        color: Colors.white,
        size: 24.0,
      ),
    );
  }
}
