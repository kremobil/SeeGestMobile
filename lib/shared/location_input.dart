import 'package:SeeGestMobileApp/controllers/location_controller.dart';
import 'package:SeeGestMobileApp/models/location_suggestion.dart';
import 'package:SeeGestMobileApp/models/place_details.dart';
import 'package:SeeGestMobileApp/providers/locationAutocompleteProvider.dart';
import 'package:SeeGestMobileApp/providers/placeDetailsProvider.dart'
    show placeDetailsProvider;
import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/dynamic_dropdown_expander.dart';
import 'package:SeeGestMobileApp/shared/styled_input.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class LocationInput extends ConsumerStatefulWidget {
  const LocationInput(
      {super.key,
      this.scrollableKey,
      this.scrollController,
      this.dynamicExpanderKey,
      this.onLocationSelected});

  final GlobalKey? scrollableKey;
  final ScrollController? scrollController;
  final GlobalKey<DynamicDropdownExpanderState>? dynamicExpanderKey;
  final void Function(PlaceDetailsModel)? onLocationSelected;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationInputState();
}

class _LocationInputState extends ConsumerState<LocationInput> {
  final TextEditingController _locationSearchController =
      TextEditingController();

  final OverlayPortalController _autoCompleteController =
      OverlayPortalController();

  final LayerLink _link = LayerLink();

  final GlobalKey _dropdownKey = GlobalKey();

  final FocusNode _focusNode = FocusNode();

  final GlobalKey _inputKey = GlobalKey();

  String _currentQuery = "";

  String? _selectedLocationName;

  LatLng? _initialPosition;

  double? _inputWidth;

  @override
  void dispose() {
    _locationSearchController.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _locationSearchController.addListener(() {
      setState(() {
        _currentQuery = _locationSearchController.text;
      });
    });

    LocationController.requestLocationPermission(context);

    LocationController.getCurrentLatLng().then((position) {
      setState(() {
        _initialPosition = position;
      });
    });
  }

  void ensureLayoutAndCalculateOverflow() {
    print("Ensure invoked");
    if (widget.dynamicExpanderKey == null) {
      print(
          "Dynamic expander key not provided - skipping overflow calculation");
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      calculateOverflow();
    });
  }

  void scrollDropdownIntoView() {
    if (widget.scrollController == null) {
      print("Scroll controller not provided - skipping scroll to view");
      return;
    }

    ScrollableState? scrollableState = Scrollable.of(context);
    if (scrollableState == null) {
      print("Scrollable state not found - cannot scroll dropdown into view");
      return;
    }

    double? endOfDropdownInScrollable = dropdownPositionInScrollable();
    if (endOfDropdownInScrollable == null) {
      print("Cannot determine dropdown position - skipping scroll");
      return;
    }

    double? offsetPadding = getOffsetPadding();
    if (offsetPadding == null) {
      print("Cannot determine offset padding - skipping scroll");
      return;
    }

    double targetScrollPosition = endOfDropdownInScrollable -
        scrollableState.position.viewportDimension +
        offsetPadding;

    double currentScrollPosition = widget.scrollController!.offset;
    if ((targetScrollPosition - currentScrollPosition).abs() < 1.0) {
      print("Scroll not needed - dropdown already in view");
      return;
    }

    widget.scrollController!.animateTo(
      targetScrollPosition,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void calculateOverflow() {
    if (widget.dynamicExpanderKey?.currentState == null) {
      print("Dynamic expander state not available - cannot calculate overflow");
      return;
    }

    double? scrollableHeight = getScrollableHeight();
    if (scrollableHeight == null) {
      print(
          "Cannot determine scrollable height - skipping overflow calculation");
      return;
    }

    double? endOfDropdownInScrollable = dropdownPositionInScrollable();
    if (endOfDropdownInScrollable == null) {
      print(
          "Cannot determine dropdown position - skipping overflow calculation");
      return;
    }

    double? offsetPadding = getOffsetPadding();
    if (offsetPadding == null) {
      print("Cannot determine offset padding - skipping overflow calculation");
      return;
    }

    double dropdownOverflow =
        (endOfDropdownInScrollable - scrollableHeight) + offsetPadding;
    double currentExpanderHeight =
        widget.dynamicExpanderKey!.currentState!.currentHeight;

    if (dropdownOverflow < 0) {
      double newHeight = currentExpanderHeight + dropdownOverflow > 0
          ? currentExpanderHeight + dropdownOverflow
          : 0;
      widget.dynamicExpanderKey!.currentState!.updateHeight(newHeight);
    } else if (dropdownOverflow == 0) {
      widget.dynamicExpanderKey!.currentState!
          .updateHeight(currentExpanderHeight);
    } else {
      widget.dynamicExpanderKey!.currentState!.updateHeight(dropdownOverflow);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollDropdownIntoView();
    });
  }

  double? getOffsetPadding() {
    double? scrollableHeight = getScrollableHeight();
    if (scrollableHeight == null) return null;

    double? expanderEndPosition = expanderPositionInScrollable();
    if (expanderEndPosition == null) return null;

    return scrollableHeight - expanderEndPosition;
  }

  double? getScrollableHeight() {
    ScrollableState? scrollableState = Scrollable.of(context);
    if (scrollableState == null) return null;

    ScrollPosition? scrollPosition = scrollableState.position;
    if (scrollPosition == null) return null;

    return scrollPosition.maxScrollExtent + scrollPosition.viewportDimension;
  }

  double? dropdownPositionInScrollable() {
    RenderBox? dropdownBox =
        _dropdownKey.currentContext?.findRenderObject() as RenderBox?;
    if (dropdownBox == null) return null;

    RenderBox? scrollableBox =
        widget.scrollableKey?.currentContext?.findRenderObject() as RenderBox?;
    if (scrollableBox == null) return null;

    ScrollableState? scrollableState = Scrollable.of(context);
    if (scrollableState == null) return null;

    ScrollPosition? scrollPosition = scrollableState.position;
    if (scrollPosition == null) return null;

    Offset viewportPosition = scrollableBox.localToGlobal(Offset.zero);
    Offset dropdownPosition = dropdownBox.localToGlobal(Offset.zero);

    return (dropdownPosition.dy - viewportPosition.dy) +
        scrollPosition.pixels +
        dropdownBox.size.height;
  }

  double? expanderPositionInScrollable() {
    RenderBox? expanderBox = widget.dynamicExpanderKey?.currentContext
        ?.findRenderObject() as RenderBox?;
    if (expanderBox == null) return null;

    RenderBox? scrollableBox =
        widget.scrollableKey?.currentContext?.findRenderObject() as RenderBox?;
    if (scrollableBox == null) return null;

    ScrollableState? scrollableState = Scrollable.of(context);
    if (scrollableState == null) return null;

    ScrollPosition? scrollPosition = scrollableState.position;
    if (scrollPosition == null) return null;

    Offset viewportPosition = scrollableBox.localToGlobal(Offset.zero);
    Offset expanderPosition = expanderBox.localToGlobal(Offset.zero);

    return (expanderPosition.dy - viewportPosition.dy) +
        scrollPosition.pixels +
        expanderBox.size.height;
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<LocationSuggestionModel>> autocompleteAsync =
        ref.watch(
      LocationAutocompleteProvider(
        query: _currentQuery,
        latitude: _initialPosition?.latitude ?? 53.123482,
        longitude: _initialPosition?.longitude ?? 18.008438,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      autocompleteAsync.when(data: (data) {
        if (data.isEmpty) {
          _autoCompleteController.hide();
          if (widget.dynamicExpanderKey?.currentState != null) {
            widget.dynamicExpanderKey!.currentState!.updateHeight(0);
          }
        } else {
          _inputWidth = context.size?.width;
          _autoCompleteController.show();
          // Poczekaj aż UI się zaktualizuje
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ensureLayoutAndCalculateOverflow();
          });
        }
      }, error: (error, stack) {
        _autoCompleteController.hide();
        if (widget.dynamicExpanderKey?.currentState != null) {
          widget.dynamicExpanderKey!.currentState!.updateHeight(0);
        }
      }, loading: () {
        // Możesz pokazać wskaźnik ładowania, jeśli chcesz
      });
    });

    return Column(
      children: [
        CompositedTransformTarget(
          link: _link,
          child: OverlayPortal(
            controller: _autoCompleteController,
            overlayChildBuilder: (context) {
              return CompositedTransformFollower(
                link: _link,
                targetAnchor: Alignment.bottomLeft,
                followerAnchor: Alignment.topLeft,
                child: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: TapRegion(
                      onTapOutside: (PointerDownEvent event) {
                        final RenderBox? inputBox = _inputKey.currentContext
                            ?.findRenderObject() as RenderBox?;
                        if (inputBox != null) {
                          final Offset inputPosition =
                              inputBox.localToGlobal(Offset.zero);
                          final Size inputSize = inputBox.size;

                          final bool clickedInInput =
                              event.position.dx >= inputPosition.dx &&
                                  event.position.dx <=
                                      inputPosition.dx + inputSize.width &&
                                  event.position.dy >= inputPosition.dy &&
                                  event.position.dy <=
                                      inputPosition.dy + inputSize.height;

                          if (clickedInInput) {
                            return;
                          }
                        }

                        _focusNode.unfocus();
                        _locationSearchController.text = "";
                      },
                      child: AutoCompleteContianer(
                          width: _inputWidth ?? 200,
                          key: _dropdownKey,
                          onAutocompleteSelected: (placeDetails) {
                            // Handle the selected place details
                            _locationSearchController.text = "";
                            _focusNode.unfocus();
                            setState(() {
                              _selectedLocationName =
                                  placeDetails.displayName.text;
                            });
                            
                            widget.onLocationSelected?.call(placeDetails);
                          },
                          suggestions: autocompleteAsync),
                    )),
              );
            },
            child: StyledInput(
              controller: _locationSearchController,
              labelText: "Lokalizacja ",
              hintText: _selectedLocationName ?? "Wyszukaj lokalizację",
              focusNode: _focusNode,
              key: _inputKey,
              onSubmitted: (value) {},
              onTap: () {},
              prefixIcon: Icon(FontAwesomeIcons.locationDot,
                  color: AppColors.mainColor),
              onChanged: (value) {
                setState(() {
                  _currentQuery = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}

class AutoCompleteContianer extends ConsumerWidget {
  const AutoCompleteContianer(
      {super.key,
      required this.width,
      required this.onAutocompleteSelected,
      required this.suggestions});

  final void Function(PlaceDetailsModel) onAutocompleteSelected;

  final AsyncValue<List<LocationSuggestionModel>> suggestions;

  final double width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.only(top: 4.0),
      width: width,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: AppColors.mainColor,
          width: 1.5,
        ),
      ),
      child: suggestions.when(
        data: (suggestions) {
          return ListView.builder(
            itemCount: suggestions.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final suggestion = suggestions[index];
              return ListBody(
                children: [
                  GestureDetector(
                    onTap: () async {
                      final placeDetails = await ref.read(
                          placeDetailsProvider(placeId: suggestion.placeId)
                              .future);

                      onAutocompleteSelected(placeDetails);
                    },
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.locationDot,
                            size: 16, color: AppColors.mainColor),
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
                                style: GoogleFonts.lato(
                                    fontSize: 14, color: AppColors.mainColor),
                              ),
                              Text(
                                  suggestion
                                      .structuredFormat.secondaryText?.text ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                      fontSize: 13,
                                      color: AppColors.secondaryColor))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          );
        },
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        loading: () => SizedBox(
          width: width,
          height: 200,
          child: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
