import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final IconData icon;

  const CustomIconButton({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Make the button 100% width of its parent
      child: ElevatedButton(
        onPressed: () {
          // Define the action when the button is pressed
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, 
          backgroundColor: const Color(0xFF162968), // Set background color to #162968
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // 8px border radius
          ),
          minimumSize: const Size.fromHeight(43), // Set the button height to 43px
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center, // Center the content
          children: <Widget>[
            Text(text),
            const SizedBox(width: 8), // Add some space between text and icon
            Icon(icon, color: Colors.white),
          ],
        ),
      ),
    );
  }
}