import 'package:SeeGestMobileApp/classes/colors.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;

  const CustomInput({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller
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
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText, // Hint text inside the input
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0), // Adjust vertical and horizontal padding
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0), // 8px border radius
                borderSide: const BorderSide(
                  color: AppColors.grey, // 1px black border
                  width: 3.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}