import 'package:SeeGestMobileApp/models/icon.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:flutter/material.dart';

class SeegestMarker extends StatelessWidget {
  const SeegestMarker({super.key, required this.postIcon});

  final IconModel postIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 54,
      child: Stack(
        children: [
          Positioned(
            top: 18,
            left: 0,
            child: ClipPath(
              clipper: BottomPinClip(),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                ),
              ),
            ),
          ),
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.network(
                postIcon.file.url,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomPinClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height * 0.12);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height * 0.12);
    path.lineTo(size.width, 0);
    path.lineTo(0.0, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
