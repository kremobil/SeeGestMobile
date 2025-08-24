import 'dart:async';

import 'package:SeeGestMobileApp/controllers/location_controller.dart';
import 'package:SeeGestMobileApp/models/icon.dart';
import 'package:SeeGestMobileApp/providers/locationAutocompleteProvider.dart';
import 'package:SeeGestMobileApp/providers/placeDetailsProvider.dart';
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/seegest_marker.dart';
import 'package:SeeGestMobileApp/shared/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

class Step2 extends ConsumerStatefulWidget {
  const Step2(
      {super.key,
      required this.onStepComplete,
      required this.postIcon,
      this.initialLat,
      this.initialLng,
      this.initalLocationName});

  final void Function(double lat, double lng, String locationName)
      onStepComplete;

  final IconModel postIcon;

  final double? initialLat;
  final double? initialLng;
  final String? initalLocationName;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Step2State();
}

class _Step2State extends ConsumerState<Step2> with TickerProviderStateMixin {
  late GoogleMapController _mapController;

  LatLng? _initialPosition;

  bool _mapReady = false;

  bool? _permissionGranted;

  String? _LocationName;

  LatLng? _LocationPostion;

  Marker? _selectedLocationMarker;

  int _locationSelectionType = 0;

  Timer? _mapGrabTimer;

  final TextEditingController _searchController = TextEditingController();
  String _currentQuery = '';

  final OverlayPortalController _locationsSuggestionController =
      OverlayPortalController();

  final LayerLink _locationsSuggestionLayerLink = LayerLink();

  late AnimationController _buttonsAnimationController;

  late Animation<double> _leftButtonAnimation;
  late Animation<double> _rightButtonAnimation;
  late Animation<double> _buttonsSpacingAnimation;
  late Animation<double> _leftButtonContentScaleAnimation;
  late Animation<double> _rightButtonContentScaleAnimation;
  late Animation<double> _searchFieldWidthAnimation;
  late Animation<double> _showSearchLocationUIAnimation;
  late Animation<double> _showMapSelectionUIAnimation;
  late Animation<double> _mapSelectionOpacityAnimation;

  late AnimationController _locationSuggestionAnimationController;

  late Animation<double> _suggestionsBorderRadiusAnimation;
  late Animation<double> _suggestionsContainerHeightAnimation;

  double targetPosition = 0;

  FocusNode _searchFocusNode = FocusNode();

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    _requestLocationPermission().then((_) {
      if (
          widget.initialLat != null &&
          widget.initialLng != null) {
        
        if (widget.initalLocationName != null) {
          _LocationName = widget.initalLocationName;
        } else {
          _getLocationName(widget.initialLat!, widget.initialLng!);
        }

        _createPostMarker(LatLng(widget.initialLat!, widget.initialLng!));

        setState(() {
              _initialPosition = LatLng(widget.initialLat!, widget.initialLng!);
              _LocationPostion = LatLng(widget.initialLat!, widget.initialLng!);
              _mapReady = true;
            });
      } else {
        if (_permissionGranted == true) {
          LocationController.getCurrentLatLng().then((LatLng position) {
            _getLocationName(position.latitude, position.longitude);
            _createPostMarker(position);
            setState(() {
              _initialPosition = position;
              _LocationPostion = position;
              _mapReady = true;
            });
          });
        }
      }
    });

    _searchController.addListener(_onSearchChanged);

    _buttonsAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _leftButtonAnimation = Tween<double>(begin: 150, end: 150).animate(
      CurvedAnimation(
        parent: _buttonsAnimationController,
        curve: Interval(0.0, 0.5),
      ),
    );
    _rightButtonAnimation = Tween<double>(begin: 150, end: 150).animate(
      CurvedAnimation(
        parent: _buttonsAnimationController,
        curve: Interval(0.0, 0.5),
      ),
    );

    _leftButtonContentScaleAnimation =
        Tween<double>(begin: 1.0, end: 1.0).animate(CurvedAnimation(
      parent: _buttonsAnimationController,
      curve: Interval(0.0, 0.5),
    ));

    _buttonsSpacingAnimation = Tween<double>(begin: 16.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _buttonsAnimationController,
        curve: Interval(0.0, 0.5),
      ),
    );

    _rightButtonContentScaleAnimation =
        Tween<double>(begin: 1.0, end: 1.0).animate(CurvedAnimation(
      parent: _buttonsAnimationController,
      curve: Interval(0.0, 0.5),
    ));

    _searchFieldWidthAnimation = Tween<double>(begin: 61, end: 242).animate(
      CurvedAnimation(
        parent: _buttonsAnimationController,
        curve: Interval(0.65, 1.0),
      ),
    );

    _showSearchLocationUIAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _buttonsAnimationController,
        curve: Interval(0.35, 0.7),
      ),
    );

    _showMapSelectionUIAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _buttonsAnimationController,
        curve: Interval(0.35, 0.7),
      ),
    );

    _mapSelectionOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _buttonsAnimationController,
        curve: Interval(0.65, 1.0),
      ),
    );

    // Autocomplete suggestions animation

    _locationSuggestionAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _suggestionsBorderRadiusAnimation =
        Tween<double>(begin: 8.0, end: 0.0).animate(CurvedAnimation(
      parent: _locationSuggestionAnimationController,
      curve: Interval(0.0, 0.5),
    ));

    _suggestionsContainerHeightAnimation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(
            parent: _locationSuggestionAnimationController,
            curve: Interval(0.4, 1)));
  }

  void _onSearchChanged() {
    setState(() {
      _currentQuery = _searchController.text;
    });
  }

  @override
  void dispose() {
    _buttonsAnimationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _changeSelectionType(int newSelectionType) {
    if (_locationSelectionType == newSelectionType) return;
    if (_initialPosition == null || _mapReady == false) return;

    // animate from default state
    if (_locationSelectionType == 0) {
      if (newSelectionType == 1) {
        _setUpSearchButtonAnimation();
      } else {
        _setUpLocationSelectButtonAnimation();
      }

      _buttonsAnimationController.forward(from: 0).then((_) {
        if (_locationSelectionType == 1) {
          _searchFocusNode.requestFocus();
        }
      });
    } else {
      if (_locationSelectionType == 1) {
        _setUpSearchButtonAnimation();
      } else {
        _setUpLocationSelectButtonAnimation();
      }

      _buttonsAnimationController.reverse(from: 1);
    }

    _locationSelectionType = newSelectionType;

    if (newSelectionType == 2) {
      setState(() {
        _selectedLocationMarker = null;
      });
    }
    // Tworzymy nowe animacje z aktualnych pozycji do docelowych
  }

  void _setUpSearchButtonAnimation() {
    _leftButtonAnimation = Tween<double>(
      begin: 150.0,
      end: 316.0,
    ).animate(CurvedAnimation(
      parent: _buttonsAnimationController,
      curve: Interval(0.0, 0.4),
    ));

    _rightButtonAnimation = Tween<double>(
      begin: 150.0,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _buttonsAnimationController,
      curve: Interval(0.0, 0.4),
    ));

    _leftButtonContentScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _buttonsAnimationController,
      curve: Interval(0.0, 0.4),
    ));

    _rightButtonContentScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _buttonsAnimationController,
      curve: Interval(0.0, 0.4),
    ));
  }

  void _setUpLocationSelectButtonAnimation() {
    _leftButtonAnimation = Tween<double>(
      begin: 150.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _buttonsAnimationController,
      curve: Interval(0.0, 0.6),
    ));

    _rightButtonAnimation = Tween<double>(
      begin: 150.0,
      end: 316.0,
    ).animate(CurvedAnimation(
      parent: _buttonsAnimationController,
      curve: Interval(0.0, 0.6),
    ));

    _leftButtonContentScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _buttonsAnimationController,
      curve: Interval(0.0, 0.6),
    ));

    _rightButtonContentScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _buttonsAnimationController,
      curve: Interval(0.0, 0.6),
    ));
  }

  Future<void> _createPostMarker(LatLng postion) async {
    BitmapDescriptor bitmapDescriptor =
        await SeegestMarker(postIcon: widget.postIcon).toBitmapDescriptor(
            logicalSize: const Size(36, 54), imageSize: const Size(100, 100));
    setState(() {
      _selectedLocationMarker = Marker(
          markerId: MarkerId('currentLocation'),
          position: postion,
          icon: bitmapDescriptor);
    });
  }

  Future<bool> _requestLocationPermission() async {
    bool permissionGranted =
        await LocationController.requestLocationPermission(context);
    setState(() {
      _permissionGranted = permissionGranted;
    });
    return permissionGranted;
  }

  Future<void> _getLocationName(double lat, double lng) async {
    String locationName = await LocationController.getLocationName(lat, lng);
    setState(() {
      _LocationName = locationName;
    });
  }

  @override
  Widget build(BuildContext context) {
    final autocompleteAsync = ref.watch(
      LocationAutocompleteProvider(
        query: _currentQuery,
        latitude: _initialPosition?.latitude ?? 53.123482, // Warsaw default
        longitude: _initialPosition?.longitude ?? 18.008438,
      ),
    );

    return Stack(
      children: [
        if (_mapReady)
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: _initialPosition!, zoom: 14),
            zoomControlsEnabled: false,
            onMapCreated: _onMapCreated,
            myLocationEnabled: _permissionGranted ?? false,
            onCameraIdle: () {
              if (_locationSelectionType != 2) return;

              _mapGrabTimer = Timer(const Duration(seconds: 2), () async {
                LatLngBounds visibleRegion =
                    await _mapController.getVisibleRegion();
                LatLng position = LatLng(
                  (visibleRegion.northeast.latitude +
                          visibleRegion.southwest.latitude) /
                      2,
                  (visibleRegion.northeast.longitude +
                          visibleRegion.southwest.longitude) /
                      2,
                );

                _getLocationName(position.latitude, position.longitude);
                setState(() {
                  _LocationPostion = position;
                });
              });
            },
            onCameraMoveStarted: () {
              if (_locationSelectionType != 2) return;

              if (_LocationName != "Odczytywanie Lokalizacji...") {
                setState(() {
                  _LocationName = "Odczytywanie Lokalizacji...";
                });
              }

              _mapGrabTimer?.cancel();
            },
            myLocationButtonEnabled: true,
            markers: _selectedLocationMarker != null
                ? {_selectedLocationMarker!}
                : {},
          )
        else
          Center(child: CircularProgressIndicator()),
        Positioned(
            child: Center(
          heightFactor: 1,
          child: Container(
            clipBehavior: Clip.none,
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedBuilder(
                  animation: _buttonsAnimationController,
                  builder: (context, child) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_leftButtonAnimation.value > 0)
                        GestureDetector(
                          onTap: () {
                            _changeSelectionType(1);
                          },
                          child: AnimatedBuilder(
                              animation: _locationSuggestionAnimationController,
                              builder: (context, child) {
                                return CompositedTransformTarget(
                                  link: _locationsSuggestionLayerLink,
                                  child: OverlayPortal(
                                    controller: _locationsSuggestionController,
                                    overlayChildBuilder: (context) {
                                      return CompositedTransformFollower(
                                          link: _locationsSuggestionLayerLink,
                                          targetAnchor: Alignment.bottomLeft,
                                          followerAnchor: Alignment.topLeft,
                                          child: Align(
                                            alignment: Alignment.topLeft,
                                            child: Material(
                                              clipBehavior: Clip.none,
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(0),
                                                      bottom:
                                                          Radius.circular(8)),
                                              elevation: 3,
                                              child: SizeTransition(
                                                fixedCrossAxisSizeFactor: 1,
                                                sizeFactor:
                                                    _suggestionsContainerHeightAnimation,
                                                axisAlignment: -1,
                                                axis: Axis.vertical,
                                                child: Container(
                                                  width: _leftButtonAnimation
                                                      .value,
                                                  clipBehavior: Clip.none,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.whiteColor,
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                            top:
                                                                Radius.circular(
                                                                    0),
                                                            bottom:
                                                                Radius.circular(
                                                                    8)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.black
                                                            .withValues(
                                                                alpha: 0.2),
                                                        blurRadius: 6,
                                                        offset: Offset(0, 3),
                                                      ),
                                                    ],
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Container(
                                                        height: 1,
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                            gradient: AppColors
                                                                .primaryGradient),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        child: Column(
                                                          spacing: 8,
                                                          children: [
                                                            ...autocompleteAsync
                                                                .when(
                                                              data:
                                                                  (suggestions) =>
                                                                      [
                                                                if (suggestions
                                                                    .isNotEmpty)
                                                                  ...suggestions.map(
                                                                      (suggestion) =>
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () async {
                                                                              final placeDetails = await ref.read(placeDetailsProvider(placeId: suggestion.placeId).future);

                                                                              _locationSuggestionAnimationController.reverse(from: 1).then((_) {
                                                                                _searchController.clear();
                                                                                _searchFocusNode.unfocus();
                                                                                _locationsSuggestionController.hide();

                                                                                LatLng placeLocation = LatLng(placeDetails.location.latitude, placeDetails.location.longitude);

                                                                                _createPostMarker(placeLocation);
                                                                                setState(() {
                                                                                  _LocationPostion = placeLocation;
                                                                                  _LocationName = placeDetails.displayName.text;
                                                                                });

                                                                                _mapController.animateCamera(CameraUpdate.newLatLng(placeLocation));
                                                                              });
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Icon(FontAwesomeIcons.locationDot, size: 16, color: AppColors.mainColor),
                                                                                const SizedBox(width: 8),
                                                                                Expanded(
                                                                                  child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    // alignment: WrapAlignment.start,
                                                                                    // direction: Axis.horizontal,
                                                                                    spacing: 2.0,
                                                                                    children: [
                                                                                      Text(
                                                                                        suggestion.structuredFormat.mainText.text,
                                                                                        overflow: TextOverflow.ellipsis,
                                                                                        style: GoogleFonts.lato(fontSize: 14, color: AppColors.mainColor),
                                                                                      ),
                                                                                      Text(suggestion.structuredFormat.secondaryText.text, overflow: TextOverflow.ellipsis, style: GoogleFonts.lato(fontSize: 13, color: AppColors.secondaryColor))
                                                                                    ],
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ))
                                                                else
                                                                  Text(
                                                                    "Brak Wyników",
                                                                    style: GoogleFonts.lato(
                                                                        fontSize:
                                                                            14,
                                                                        color: AppColors
                                                                            .mainColor),
                                                                  )
                                                              ],
                                                              error: (error,
                                                                      stack) =>
                                                                  [
                                                                Text(
                                                                    'Błąd: $error',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .red))
                                                              ],
                                                              loading: () => [
                                                                Text(
                                                                    "Ładowanie podpowiedzi...")
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ));
                                    },
                                    child: Material(
                                      elevation: 2,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(8),
                                          bottom: Radius.circular(
                                              _suggestionsBorderRadiusAnimation
                                                  .value)),
                                      child: Container(
                                          height: 40,
                                          width: _leftButtonAnimation.value,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: SizeTransition(
                                            sizeFactor:
                                                _leftButtonContentScaleAnimation,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              spacing: 8,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    // Handle search icon tap
                                                    if (_locationSelectionType !=
                                                        1) {
                                                      _changeSelectionType(1);
                                                    } else {
                                                      if (!_searchFocusNode
                                                          .hasFocus) {
                                                        _searchFocusNode
                                                            .requestFocus();
                                                      }
                                                    }
                                                  },
                                                  child: ShaderMask(
                                                    blendMode: BlendMode.srcIn,
                                                    shaderCallback: (bounds) =>
                                                        AppColors
                                                            .primaryGradient
                                                            .createShader(
                                                                bounds),
                                                    child: Icon(
                                                      FontAwesomeIcons
                                                          .magnifyingGlass,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                                if (_showSearchLocationUIAnimation
                                                        .value <
                                                    1)
                                                  Stack(children: [
                                                    Opacity(
                                                      opacity: 1 -
                                                          _showSearchLocationUIAnimation
                                                              .value,
                                                      child: ShaderMask(
                                                        blendMode:
                                                            BlendMode.srcIn,
                                                        shaderCallback:
                                                            (bounds) => AppColors
                                                                .primaryGradient
                                                                .createShader(
                                                                    bounds),
                                                        child: Text("Wyszukaj",
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .mainColor,
                                                              fontSize: 16,
                                                            )),
                                                      ),
                                                    ),
                                                    Opacity(
                                                      opacity:
                                                          _showSearchLocationUIAnimation
                                                              .value,
                                                      child: Text("Wyszukaj",
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .mainColor,
                                                            fontSize: 16,
                                                          )),
                                                    ),
                                                  ]),
                                                if (_showSearchLocationUIAnimation
                                                        .value ==
                                                    1)
                                                  SizedBox(
                                                    width:
                                                        _searchFieldWidthAnimation
                                                            .value,
                                                    height: 32,
                                                    child: TextField(
                                                      focusNode:
                                                          _searchFocusNode,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: "Wyszukaj",
                                                        border:
                                                            InputBorder.none,
                                                        hintStyle: TextStyle(
                                                          color: AppColors
                                                              .secondaryColor,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      style: TextStyle(
                                                        color:
                                                            AppColors.mainColor,
                                                        fontSize: 16,
                                                      ),
                                                      controller:
                                                          _searchController,
                                                      onChanged: (value) async {
                                                        final suggestions = await LocationController
                                                            .getLocationAutocompleteSuggestions(
                                                                value,
                                                                lat: _initialPosition!
                                                                    .latitude,
                                                                lng: _initialPosition!
                                                                    .longitude);
                                                        if (_locationsSuggestionController
                                                                .isShowing &&
                                                            (value.isEmpty ||
                                                                value.trim() ==
                                                                    "")) {
                                                          _locationSuggestionAnimationController
                                                              .reverse(from: 1)
                                                              .then((_) {
                                                            _locationsSuggestionController
                                                                .hide();
                                                          });
                                                        } else if (value
                                                                .isNotEmpty &&
                                                            value.trim() !=
                                                                "" &&
                                                            !_locationsSuggestionController
                                                                .isShowing) {
                                                          _locationsSuggestionController
                                                              .show();
                                                          _locationSuggestionAnimationController
                                                              .forward(from: 0);
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                if (_showSearchLocationUIAnimation
                                                        .value >
                                                    0)
                                                  GestureDetector(
                                                    onTap: () {
                                                      _searchFocusNode
                                                          .unfocus();
                                                      _locationSuggestionAnimationController
                                                          .reverse(from: 1)
                                                          .then((_) {
                                                        _changeSelectionType(0);
                                                        _locationsSuggestionController
                                                            .hide();
                                                      });
                                                    },
                                                    child: ShaderMask(
                                                      blendMode:
                                                          BlendMode.srcIn,
                                                      shaderCallback:
                                                          (bounds) => AppColors
                                                              .primaryGradient
                                                              .createShader(
                                                                  bounds),
                                                      child: Icon(
                                                        FontAwesomeIcons
                                                            .circleXmark,
                                                        size:
                                                            _showSearchLocationUIAnimation
                                                                    .value *
                                                                18,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          )),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      SizedBox(width: _buttonsSpacingAnimation.value),
                      if (_rightButtonContentScaleAnimation.value > 0)
                        GestureDetector(
                          onTap: () {
                            _changeSelectionType(2);
                          },
                          child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                                height: 40,
                                width: _rightButtonAnimation.value,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: SizeTransition(
                                  sizeFactor: _rightButtonContentScaleAnimation,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ShaderMask(
                                        blendMode: BlendMode.srcIn,
                                        shaderCallback: (bounds) => AppColors
                                            .primaryGradient
                                            .createShader(bounds),
                                        child: Icon(
                                          FontAwesomeIcons.locationDot,
                                          size: 18,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      ShaderMask(
                                        blendMode: BlendMode.srcIn,
                                        shaderCallback: (bounds) => AppColors
                                            .primaryGradient
                                            .createShader(bounds),
                                        child: Text("Zaznacz"),
                                      ),
                                      if (_showMapSelectionUIAnimation.value >
                                          0)
                                        ClipRect(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            widthFactor:
                                                _showMapSelectionUIAnimation
                                                    .value,
                                            child: ShaderMask(
                                              blendMode: BlendMode.srcIn,
                                              shaderCallback: (bounds) =>
                                                  AppColors.primaryGradient
                                                      .createShader(bounds),
                                              child: Text(" na Mapie"),
                                            ),
                                          ),
                                        ),
                                      if (_showMapSelectionUIAnimation.value >
                                          0)
                                        ClipRect(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            widthFactor:
                                                _showMapSelectionUIAnimation
                                                    .value,
                                            child: ShaderMask(
                                              blendMode: BlendMode.srcIn,
                                              shaderCallback: (bounds) =>
                                                  AppColors.primaryGradient
                                                      .createShader(bounds),
                                              child:
                                                  const SizedBox(width: 132.6),
                                            ),
                                          ),
                                        ),
                                      if (_showMapSelectionUIAnimation.value >
                                          0)
                                        ClipRect(
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            widthFactor:
                                                _showMapSelectionUIAnimation
                                                    .value,
                                            child: Opacity(
                                              opacity:
                                                  _mapSelectionOpacityAnimation
                                                      .value,
                                              child: ShaderMask(
                                                blendMode: BlendMode.srcIn,
                                                shaderCallback: (bounds) =>
                                                    AppColors.primaryGradient
                                                        .createShader(bounds),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    _changeSelectionType(0);
                                                  },
                                                  child: ShaderMask(
                                                    blendMode: BlendMode.srcIn,
                                                    shaderCallback: (bounds) =>
                                                        AppColors
                                                            .primaryGradient
                                                            .createShader(
                                                                bounds),
                                                    child: Icon(
                                                      FontAwesomeIcons
                                                          .circleXmark,
                                                      size:
                                                          _showSearchLocationUIAnimation
                                                                  .value *
                                                              18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                )),
                          ),
                        )
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    width: 316,
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ShaderMask(
                      blendMode: BlendMode.srcIn,
                      shaderCallback: (bounds) =>
                          AppColors.primaryGradient.createShader(bounds),
                      child: Text(
                        _LocationName ?? "Odczytywanie Lokalizacji...",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(fontSize: 14),
                      ),
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
                  if (_LocationName == "Odczytywanie Lokalizacji...") {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Trwa odczytywanie lokalizacji...")));
                    return;
                  }

                  if (_LocationName == null || _LocationPostion == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Nieprawidłowa lokalizacja")));
                  }

                  widget.onStepComplete(_LocationPostion!.latitude,
                      _LocationPostion!.longitude, _LocationName!);
                },
                icon: FontAwesomeIcons.chevronRight,
              ),
            ),
          ),
        ),
        if (_locationSelectionType == 2)
          Center(
            child: Transform.translate(
                offset: const Offset(0, -24),
                child: SeegestMarker(postIcon: widget.postIcon)),
          )
      ],
    );
  }
}
