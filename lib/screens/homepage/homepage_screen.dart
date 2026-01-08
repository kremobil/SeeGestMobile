import 'package:SeeGestMobileApp/controllers/location_controller.dart';
import 'package:SeeGestMobileApp/controllers/post_controller.dart';
import 'package:SeeGestMobileApp/models/post.dart';
import 'package:SeeGestMobileApp/models/tags.dart';
import 'package:SeeGestMobileApp/providers/calendarPreviewProvider.dart';
import 'package:SeeGestMobileApp/providers/locationAutocompleteProvider.dart';
import 'package:SeeGestMobileApp/shared/dashboard_layout.dart';
import 'package:SeeGestMobileApp/shared/dynamic_dropdown_expander.dart';
import 'package:SeeGestMobileApp/shared/location_input.dart';
import 'package:SeeGestMobileApp/shared/styled_button.dart';
import 'package:SeeGestMobileApp/shared/tags_input.dart';
import 'package:SeeGestMobileApp/widgets/homepage_calendar.dart';
import 'package:SeeGestMobileApp/widgets/time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';

class HomepageScreen extends ConsumerStatefulWidget {
  const HomepageScreen({super.key});

  @override
  ConsumerState<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends ConsumerState<HomepageScreen> {
  final GlobalKey _scrollableKey = GlobalKey();
  ScrollController _scrollController = ScrollController();
  final GlobalKey<DynamicDropdownExpanderState> _dynamicExpanderKey =
      GlobalKey<DynamicDropdownExpanderState>();
  TimeOfDay? fromTime;
  TimeOfDay? toTime;
  DateTime? selectedDay = DateTime.now();
  DateTime? _focusedDay = DateTime.now();
  List<TagsModel> selectedTags = [];
  double? latitude;
  double? longitude;

  int timeInMinutes(TimeOfDay time) {
    return (time.hour * 60) + time.minute;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    LocationController.getCurrentLatLng().then((latlng) {
      if (!mounted) return;
      setState(() {
        latitude = latlng.latitude;
        longitude = latlng.longitude;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      body: Overlay(initialEntries: [
        OverlayEntry(
          builder: (context) {
            AsyncValue<List<DateTime>> calendarPreview = ref.watch(
                calendarPreviewProvider(
                    month: _focusedDay!.month,
                    year: _focusedDay!.year,
                    fromTime: fromTime,
                    toTime: toTime,
                    tags: selectedTags));

            final postsDates =
                calendarPreview.whenOrNull(data: (data) => data) ?? [];

            return SingleChildScrollView(
              key: _scrollableKey,
              controller: _scrollController,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    LocationInput(
                      scrollableKey: _scrollableKey,
                      scrollController: _scrollController,
                      dynamicExpanderKey: _dynamicExpanderKey,
                      onLocationSelected: (placeDetails) {
                        latitude = placeDetails.location.latitude;
                        longitude = placeDetails.location.longitude;
                      },
                    ),
                    const SizedBox(height: 16),
                    TimePickerWidget(
                      labelText: "Od godziny",
                      onTimeSelected: (time) {
                        setState(() {
                          fromTime = time;
                        });
                      },
                      validator: (time) {
                        if (toTime == null) {
                          return null;
                        }

                        final int selectedMinutes = timeInMinutes(time);
                        final int toMinutes = timeInMinutes(toTime ?? TimeOfDay(hour: 23, minute: 59));

                        print(
                            "Validating selected $selectedMinutes > $toMinutes");

                        if (selectedMinutes > toMinutes) {
                          return "Godzina początkowa nie może być większa od końcowej";
                        }
                      },
                    ), // Add the TimePickerWidget
                    const SizedBox(height: 16),
                    TimePickerWidget(
                      labelText: "Do godziny",
                      onTimeSelected: (time) {
                        setState(() {
                          toTime = time;
                        });
                      },
                      validator: (time) {
                        if (toTime == null) {
                          return null;
                        }

                        final int selectedMinutes = timeInMinutes(time);
                        final int fromMinutes = timeInMinutes(fromTime ?? TimeOfDay(hour: 0, minute: 0));

                        if (selectedMinutes < fromMinutes) {
                          return "Godzina końcowa nie może być mniejsza od początkowej";
                        }
                      },
                    ), // Add the TimePickerWidget
                    const SizedBox(
                        height:
                            16), // Add space between time picker and calendar
                    HomepageCalendar(
                      postsDates: postsDates,
                      onDaySelected: (day) {
                        setState(() {
                          selectedDay = day;
                        });
                      },
                      onPageChanged: (focusedDay) {
                        setState(() {
                          _focusedDay = focusedDay;
                        });
                      },
                    ),
                    const SizedBox(
                        height:
                            16), // Add space between time picker and calendar
                    TagsInput(
                      scrollableKey: _scrollableKey,
                      scrollController: _scrollController,
                      dynamicExpanderKey: _dynamicExpanderKey,
                      onTagsChanged: (tags) {
                        setState(() {
                          selectedTags = List.from(tags);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    StyledFilledButton(
                      text: "Szukaj",
                      callback: () async {
                        DateTime dateFrom = DateTime(
                              selectedDay!.year,
                              selectedDay!.month,
                              selectedDay!.day,
                                fromTime?.hour ?? 0,
                                fromTime?.minute ?? 0);
                          DateTime dateTo = DateTime(
                              selectedDay!.year,
                              selectedDay!.month,
                              selectedDay!.day,
                                toTime?.hour ?? 23,
                                toTime?.minute ?? 59);

                          List<PostModel> posts = await PostController.searchPosts(dateFrom, dateTo, selectedTags, latitude, longitude);

                          if (context.mounted) {
                            Navigator.pushNamed(context, '/search_posts', arguments: posts);
                          }
                      },
                      icon: FontAwesomeIcons.magnifyingGlass,
                    ),
                    DynamicDropdownExpander(
                      key: _dynamicExpanderKey,
                    ),
                    SizedBox(
                      height: 32,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ]),
    );
  }
}
