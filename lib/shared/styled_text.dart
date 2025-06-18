import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledHeadingText extends StatelessWidget {
  const StyledHeadingText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.lato(
      color: AppColors.mainColor,
      fontSize: 24,
      fontWeight: FontWeight.w600
    ),);
  }
}

class StyledBodyText extends StatelessWidget {
  const StyledBodyText(this.text, {super.key, this.textAlign});

  final String text;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.lato(
      color: AppColors.mainColor,
      fontSize: 14,
      fontWeight: FontWeight.w400
    ), textAlign: textAlign);
  }
}