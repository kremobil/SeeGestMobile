import 'package:SeeGestMobileApp/classes/colors.dart';
import 'package:SeeGestMobileApp/main.dart';
import 'package:SeeGestMobileApp/views/nav_bar_views/homepage_founded_posts.dart';
import 'package:SeeGestMobileApp/widgets/post.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://example.com/profile.jpg'), // Replace with your profile image URL
                ),
                const SizedBox(
                    width: 8), // Add some space between the image and the text
                const Text(
                  'User Name', // Replace with the user's name
                  style: TextStyle(
                      color: Colors.white), // Set the text color to white
                ),
              ],
            ),
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
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 24.0), // Add horizontal padding
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         TimePickerWidget(), // Add the TimePickerWidget
      //         const SizedBox(height: 32), // Add space between time picker and calendar
      //         MonthlyCalendar(initialDate: DateTime.now()),
      //       ],
      //     ),
      //   ),
      // ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 6.0), // Add horizontal padding
          child: HomepageFoundedPosts(
            posts: [
              PostWidget(
                  profileImageUrl: 'aaaa',
                  userName: 'aaaa',
                  time: '21:37',
                  title: 'tytuł',
                  location: 'bromberg',
                  content: 'serfgvjshrdjkvsdfvbsfd',
                  tags: ['tag1', 'tag2']),
              PostWidget(
                  profileImageUrl: 'aaaa',
                  userName: 'aaaa',
                  time: '21:37',
                  title: 'tytuł',
                  location: 'bromberg',
                  content: 'serfghjrsfthgeuiagvjshrdjkvsdfvbsfd',
                  tags: ['tag1', 'tag2']),
            ],
          ),),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
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