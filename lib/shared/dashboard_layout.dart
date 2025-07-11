import 'package:SeeGestMobileApp/screens/homepage/homepage_appbar.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardLayout extends StatefulWidget {
  const DashboardLayout({super.key, required this.body, this.appBar = const HomepageAppbar()});

  final Widget body;
  final PreferredSizeWidget appBar;

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  late int _selectedIndex = 0;

  void Function(int)? _onItemTapped(BuildContext context) {
    return (int index) async {
      print("Tapped index: $index");
      int newIndex = await navigate(index, context);

      setState(() {
        _selectedIndex = newIndex;
      });
    };
  }

  Future<void> _launchInBrowserView(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  int navigate(int index, BuildContext context) {
    if (context.mounted == false) {
      print("Context is not mounted, returning -1.");
      return -1; // Return -1 if the context is not mounted
    }
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacementNamed('/home');
        return index; // Navigate to the homepage
      case 1:
        Navigator.of(context).pushReplacementNamed('/add-post');
        return index; // Navigate to the add post screen
      case 2:
        Navigator.of(context).pushReplacementNamed('/map');
        return index; // Navigate to the map screen
      case 3:
        _launchInBrowserView(
            Uri.parse('https://seegest.com')); // Replace with your help URL
        return _selectedIndex; // Replace with your help URL
      default:
        Navigator.of(context).pushReplacementNamed('/home');
        return 0; // Navigate to the homepage
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: widget.body,
      // body: SingleChildScrollView(
      //   key: _scrollableKey,
      //   controller: _scrollController,
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 24.0),
      //     child: Column(
      //       children: [
      //         TimePickerWidget(), // Add the TimePickerWidget
      //         const SizedBox(
      //             height: 32), // Add space between time picker and calendar
      //         HomepageCalendar(),
      //         TagsInput(
      //           scrollableKey: _scrollableKey,
      //           scrollController: _scrollController,
      //           dynamicExpanderKey: _dynamicExpanderKey,
      //         ),
      //         DynamicDropdownExpander(
      //           key: _dynamicExpanderKey,
      //         ),
      //         SizedBox(
      //           height: 16,
      //         )
      //       ],
      //     ),
      //   ),
      // ),
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
          onTap: _onItemTapped(context),
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
