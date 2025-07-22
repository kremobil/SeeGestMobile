import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';

// Normal input

class StyledInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final Widget? additionalLabelWidget;
  final bool obscureText;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final bool readOnly;
  final Icon? prefixIcon;

  const StyledInput(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.controller,
      this.additionalLabelWidget,
      this.obscureText = false,
      this.onTap,
      this.onChanged,
      this.readOnly = false,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            StyledInputLabelText(labelText),
            if (additionalLabelWidget != null) ...[
              const Expanded(child: SizedBox()),
              additionalLabelWidget!,
            ]
          ],
        ),
        const SizedBox(height: 4),
        TextField(
          readOnly: readOnly,
          controller: controller,
          cursorColor: AppColors.mainColor,
          obscureText: obscureText,
          onTap: onTap,
          onChanged: (value) {
            if (onChanged != null) {
              onChanged!(value);
            }
          },
          style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppColors.secondaryColor),
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.lato().copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: AppColors.mainColor), // Hint text inside the input
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: AppColors.mainColor, width: 1.5)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.mainColor, width: 2)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: AppColors.errorColor, width: 1.5)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: AppColors.errorColor, width: 1.5)),
              errorStyle: GoogleFonts.lato().copyWith(
                color: AppColors.errorColor,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
              prefixIcon: prefixIcon,
              prefixIconColor: AppColors.mainColor),
        ),
      ],
    );
  }
}

// Form input

class StyledFormInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? additionalLabelWidget;
  final bool obscureText;
  final bool readOnly;

  const StyledFormInput(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.controller,
      this.validator,
      this.additionalLabelWidget,
      this.obscureText = false,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      //email input
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StyledInputLabelText(labelText),
            if (additionalLabelWidget != null) ...[
              const Expanded(child: SizedBox()),
              additionalLabelWidget!,
            ]
          ],
        ),
        const SizedBox(height: 4),
        TextFormField(
          readOnly: readOnly,
          validator: validator,
          controller: controller,
          cursorColor: AppColors.mainColor,
          obscureText: obscureText,
          style: GoogleFonts.lato().copyWith(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: AppColors.mainColor),
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: AppColors.mainColor), // Hint text inside the input
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: AppColors.mainColor, width: 1.5)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.mainColor, width: 2)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: AppColors.errorColor, width: 1.5)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: AppColors.errorColor, width: 1.5)),
              errorStyle: GoogleFonts.lato().copyWith(
                color: AppColors.errorColor,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              )),
        ),
      ],
    );
  }
}

// Text

class StyledInputLabelText extends StatelessWidget {
  const StyledInputLabelText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          fontSize: 18,
          fontWeight: FontWeight.normal,
          color: AppColors.mainColor),
    );
  }
}

class StyledInputText extends StatelessWidget {
  const StyledInputText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.secondaryColor),
    );
  }
}
