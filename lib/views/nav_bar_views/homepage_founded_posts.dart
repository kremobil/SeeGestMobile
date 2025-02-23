import 'package:flutter/material.dart';
import 'package:seegest/classes/colors.dart';
import 'package:seegest/widgets/post.dart';

class HomepageFoundedPosts extends StatelessWidget {
  final List<PostWidget> posts;

  const HomepageFoundedPosts({
    super.key,
    required this.posts,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  elevation: 0, // Remove default elevation
                  shadowColor: Colors.transparent, // Remove default shadow color
                ).copyWith(
                  shadowColor: WidgetStateProperty.all(Colors.black), // Set custom shadow color
                  elevation: WidgetStateProperty.all(8), // Set custom elevation
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0), // Move the content 16px to the right
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                        child: const Icon(Icons.arrow_back, color: Colors.white), // Add left arrow icon
                      ),
                      const SizedBox(width: 8), // Add some space between the icon and the text
                      ShaderMask(
                        shaderCallback: (bounds) => AppColors.primaryGradient.createShader(bounds),
                        child: const Text(
                          'Powrót',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ...posts, // Display the list of posts
          ],
        ),
      ),
    );
  }
}