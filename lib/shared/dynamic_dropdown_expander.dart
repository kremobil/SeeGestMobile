import 'package:flutter/material.dart';

class DynamicDropdownExpander extends StatefulWidget {
  const DynamicDropdownExpander({super.key});

  @override
  State<DynamicDropdownExpander> createState() =>
      DynamicDropdownExpanderState();
}

class DynamicDropdownExpanderState extends State<DynamicDropdownExpander> {
  double _height = 0;

  void updateHeight(double newHeight) {
    if (_height != newHeight) {
      setState(() {
        _height = newHeight;
      });
    }
  }

  double get currentHeight => _height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
    );
  }
}