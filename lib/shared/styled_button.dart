import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledSecondaryTextButton extends StatelessWidget {
  const StyledSecondaryTextButton(
      {super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: StyledTextButttonText(text));
  }
}

class StyledFilledButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? callback;

  const StyledFilledButton({
    super.key,
    required this.text,
    this.icon,
    this.callback
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
            foregroundColor: AppColors.whiteColor,
            backgroundColor: AppColors.mainColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StyledFilledButtonText(text),
            if (icon != null) ...[
              const SizedBox(width: 16),
              Icon(
                icon,
                color: Colors.white,
                size: 16,
              ),
            ]
          ],
        ),
      ),
    );
  }
}

// Button texts

class StyledFilledButtonText extends StatelessWidget {
  const StyledFilledButtonText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: AppColors.whiteColor),
    );
  }
}

class StyledTextButttonText extends StatelessWidget {
  const StyledTextButttonText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          color: AppColors.secondaryColor),
    );
  }
}
