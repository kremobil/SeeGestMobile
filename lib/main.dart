import 'package:flutter/material.dart';
import 'package:seegest/views/register_options.dart';
import 'package:seegest/widgets/post.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange, // Set the background color to orange
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage('https://example.com/profile.jpg'), // Replace with your profile image URL
                ),
                const SizedBox(width: 8), // Add some space between the image and the text
                const Text('User Name'), // Replace with the user's name
              ],
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0), // Add 24px side padding
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0), // Add 8px vertical margin
                width: double.infinity, // Set the button width to 100%
                child: ElevatedButton(
                  onPressed: () {
                    // Define the action when the "Powrót" button is pressed
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    alignment: Alignment.centerLeft, // Align the content to the left
                    padding: const EdgeInsets.symmetric(vertical: 8.0), // Add 8px vertical padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Add 8px border radius
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0), // Move the content 16px to the right
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.arrow_back, color: Colors.black), // Add left arrow icon
                        SizedBox(width: 8), // Add some space between the icon and the text
                        Text('Powrót'),
                      ],
                    ),
                  ),
                ),
              ),
              PostWidget(
                profileImageUrl: 'https://example.com/profile.jpg',
                userName: 'User Name',
                time: '2h ago',
                title: 'Post Title',
                location: 'Location',
                content: 'This is the main content of the post.',
                tags: ['tag1', 'tag2', 'tag3'],
              ),
              PostWidget(
                profileImageUrl: 'https://example.com/profile.jpg',
                userName: 'User Name',
                time: '2h ago',
                title: 'Post Title',
                location: 'Location',
                content: 'This is the main content of the post. sdfgdfgsd sddfgsdfgdg fgsdfgdf sf ssgfgsdfg dfgdfg sdfgsdfg dfgsdfgsdf gdfg dfg dfg sdf dfgdf dfgdfgsdfg sdf  sdfgsdfgsdfg sdfg sdg dfdger gsddgdsgdfgsdrg  dgdfgd sgergdfgs gsrgsdfg sdgdsrgsdgfgsdrdf sdgrgdfgsrdgdfgsrg sdrfdbghjksfdghdfkjg dfgdfgjksdfgsd fgdfg dfgdfgdfgdfg  dfd dfgdfgdfg dfg dfkjghsdkjhdfhg dfkhg kdjfg s fgh s',
                tags: ['tag1', 'tag2', 'tag3'],
              ),
              PostWidget(
                profileImageUrl: 'https://example.com/profile.jpg',
                userName: 'User Name',
                time: '2h ago',
                title: 'Post Title',
                location: 'Location',
                content: 'This is the main content of the post. sdfgdfgsd sddfgsdfgdg fgsdfgdf sf ssgfgsdfg dfgdfg sdfgsdfg dfgsdfgsdf gdfg dfg dfg sdf dfgdf dfgdfgsdfg sdf  sdfgsdfgsdfg sdfg sdg dfdger gsddgdsgdfgsdrg  dgdfgd sgergdfgs gsrgsdfg sdgdsrgsdgfgsdrdf sdgrgdfgsrdgdfgsrg sdrfdbghjksfdghdfkjg dfgdfgjksdfgsd fgdfg dfgdfgdfgdfg  dfd dfgdfgdfg dfg dfkjghsdkjhdfhg dfkhg kdjfg s fgh s',
                tags: ['tag1', 'tag2', 'tag3'],
              ),
              PostWidget(
                profileImageUrl: 'https://example.com/profile.jpg',
                userName: 'User Name',
                time: '2h ago',
                title: 'Post Title',
                location: 'Location',
                content: 'This is the main content of the post. sdfgdfgsd sddfgsdfgdg fgsdfgdf sf ssgfgsdfg dfgdfg sdfgsdfg dfgsdfgsdf gdfg dfg dfg sdf dfgdf dfgdfgsdfg sdf  sdfgsdfgsdfg sdfg sdg dfdger gsddgdsgdfgsdrg  dgdfgd sgergdfgs gsrgsdfg sdgdsrgsdgfgsdrdf sdgrgdfgsrdgdfgsrg sdrfdbghjksfdghdfkjg dfgdfgjksdfgsd fgdfg dfgdfgdfgdfg  dfd dfgdfgdfg dfg dfkjghsdkjhdfhg dfkhg kdjfg s fgh s',
                tags: ['tag1', 'tag2', 'tag3'],
              ),
              PostWidget(
                profileImageUrl: 'https://example.com/profile.jpg',
                userName: 'User Name',
                time: '2h ago',
                title: 'Post Title',
                location: 'Location',
                content: 'This is the main content of the post. sdfgdfgsd sddfgsdfgdg fgsdfgdf sf ssgfgsdfg dfgdfg sdfgsdfg dfgsdfgsdf gdfg dfg dfg sdf dfgdf dfgdfgsdfg sdf  sdfgsdfgsdfg sdfg sdg dfdger gsddgdsgdfgsdrg  dgdfgd sgergdfgs gsrgsdfg sdgdsrgsdgfgsdrdf sdgrgdfgsrdgdfgsrg sdrfdbghjksfdghdfkjg dfgdfgjksdfgsd fgdfg dfgdfgdfgdfg  dfd dfgdfgdfg dfg dfkjghsdkjhdfhg dfkhg kdjfg s fgh s',
                tags: ['tag1', 'tag2', 'tag3'],
              ),
              PostWidget(
                profileImageUrl: 'https://example.com/profile.jpg',
                userName: 'User Name',
                time: '2h ago',
                title: 'Post Title',
                location: 'Location',
                content: 'This is the main content of the post. sdfgdfgsd sddfgsdfgdg fgsdfgdf sf ssgfgsdfg dfgdfg sdfgsdfg dfgsdfgsdf gdfg dfg dfg sdf dfgdf dfgdfgsdfg sdf  sdfgsdfgsdfg sdfg sdg dfdger gsddgdsgdfgsdrg  dgdfgd sgergdfgs gsrgsdfg sdgdsrgsdgfgsdrdf sdgrgdfgsrdgdfgsrg sdrfdbghjksfdghdfkjg dfgdfgjksdfgsd fgdfg dfgdfgdfgdfg  dfd dfgdfgdfg dfg dfkjghsdkjhdfhg dfkhg kdjfg s fgh s',
                tags: ['tag1', 'tag2', 'tag3'],
              ),
              PostWidget(
                profileImageUrl: 'https://example.com/profile.jpg',
                userName: 'User Name',
                time: '2h ago',
                title: 'Post Title',
                location: 'Location',
                content: 'This is the main content of the post. sdfgdfgsd sddfgsdfgdg fgsdfgdf sf ssgfgsdfg dfgdfg sdfgsdfg dfgsdfgsdf gdfg dfg dfg sdf dfgdf dfgdfgsdfg sdf  sdfgsdfgsdfg sdfg sdg dfdger gsddgdsgdfgsdrg  dgdfgd sgergdfgs gsrgsdfg sdgdsrgsdgfgsdrdf sdgrgdfgsrdgdfgsrg sdrfdbghjksfdghdfkjg dfgdfgjksdfgsd fgdfg dfgdfgdfgdfg  dfd dfgdfgdfg dfg dfkjghsdkjhdfhg dfkhg kdjfg s fgh s',
                tags: ['tag1', 'tag2', 'tag3'],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.orange, // Set the background color to orange
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
        selectedItemColor: Colors.white, // Set the selected item color to white
        unselectedItemColor: Colors.white, // Set the unselected item color to white
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildIcon(IconData iconData, int index) {
    return Container(
      decoration: BoxDecoration(
        color: _selectedIndex == index ? const Color(0xFF162968) : Colors.transparent, // Blue background for selected item
        borderRadius: BorderRadius.circular(32.0), // Rounded corners
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0), // Padding around the icon
      child: Icon(
        iconData,
        color: Colors.white,
        size: 24.0,
      ),
    );
  }
}