import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class Step2 extends ConsumerStatefulWidget {
  const Step2({super.key, required this.onStepComplete});

  final void Function(double lat, double lng, String locationName)
      onStepComplete;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Step2State();
}

class _Step2State extends ConsumerState<Step2> {
  late GoogleMapController _mapController;

  bool? _permissionGranted;

  final LatLng _initialPosition = const LatLng(37.7749, -122.4194);

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    print("Step 2 initialized");
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    print('1. Rozpoczynam sprawdzanie uprawnień');

    try {
      // Sprawdź czy plugin w ogóle działa
      print('2. Sprawdzam status...');
      PermissionStatus status = await Permission.location.status;
      print('3. Obecny status: $status');

      if (!status.isGranted) {
        print('4. Proszę o uprawnienia...');
        status = await Permission.location.request();
        print('5. Nowy status: $status');
      }

      setState(() {
        _permissionGranted = status.isGranted;
      });
    } catch (e, stackTrace) {
      print('BŁĄD: $e');
      print('Stack trace: $stackTrace');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition:
              CameraPosition(target: _initialPosition, zoom: 14),
          onMapCreated: _onMapCreated,
          myLocationEnabled: _permissionGranted ?? false,
          

          // You can choose whether to show the button that lets the user
          // transport the camera to their current location.
          // This has no effect when `myLocationEnabled` is false.
          myLocationButtonEnabled: true,
        ),
        Positioned(
            child: Center(
          heightFactor: 1,
          child: Container(
            clipBehavior: Clip.none,
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 150,
                      child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.whiteColor,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) =>
                                AppColors.primaryGradient.createShader(bounds),
                            child: Icon(FontAwesomeIcons.magnifyingGlass),
                          ),
                          onPressed: () {},
                          label: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) =>
                                AppColors.primaryGradient.createShader(bounds),
                            child: Text("Wyszukaj"),
                          )),
                    ),
                    const SizedBox(width: 16),
                    SizedBox(
                      width: 150,
                      child: FilledButton.icon(
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.whiteColor,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          icon: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) =>
                                AppColors.primaryGradient.createShader(bounds),
                            child: Icon(FontAwesomeIcons.locationDot),
                          ),
                          onPressed: () {},
                          label: ShaderMask(
                            blendMode: BlendMode.srcIn,
                            shaderCallback: (bounds) =>
                                AppColors.primaryGradient.createShader(bounds),
                            child: Text("Zaznacz"),
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 48,
                    width: 316,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) =>
                          AppColors.primaryGradient.createShader(bounds),
                      child: Text("Rondo Grunwaldzkie, Bydgoszcz"),
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Center(
            heightFactor: 1,
            child: SizedBox(
              width: 316,
              child: StyledFilledButton(
                text: "Następny krok",
                callback: () {
                  return;
                },
                icon: FontAwesomeIcons.chevronRight,
              ),
            ),
          ),
        )
      ],
    );
  }
}
