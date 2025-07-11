import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton(this.text, {super.key, required this.onPressed, this.active = false});

  final void Function() onPressed;
  final String text;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      child: TextButton(
        onPressed: onPressed, child: Text(
        text,
        style: GoogleFonts.lato(
          color: active ? AppColors.mainColor : AppColors.secondaryColor,
          fontSize: 16,
          fontWeight: active ? FontWeight.w600 : FontWeight.w400,
        ),
      )),
    );
  }
}