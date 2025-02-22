import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String labelText;
  final String hintText;

  const CustomInput({
    super.key,
    required this.labelText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0), // Add 8px bottom margin
      child: Column(     //email input
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            labelText, // Label above the input
            style: const TextStyle(
              fontSize: 18.0, // Set font size to 16px
            ),
          ),
          const SizedBox(height: 4), // Add some space between label and input
          TextField(
            decoration: InputDecoration(
              hintText: hintText, // Hint text inside the input
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0), // Adjust vertical and horizontal padding
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), // 8px border radius
                borderSide: const BorderSide(
                  color: Colors.black, // 1px black border
                  width: 1.0,
                ),
              ),
            ),
          ), // Input field
        ],
      ),
    );
  }
}