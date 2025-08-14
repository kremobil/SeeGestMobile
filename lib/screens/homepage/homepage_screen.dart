import 'package:SeeGestMobileApp/shared/dashboard_layout.dart';
import 'package:SeeGestMobileApp/shared/tags_input.dart';
import 'package:SeeGestMobileApp/widgets/homepage_calendar.dart';
import 'package:SeeGestMobileApp/widgets/time_picker.dart';
import 'package:flutter/material.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  final GlobalKey _scrollableKey = GlobalKey();
  ScrollController _scrollController = ScrollController();
  final GlobalKey<DynamicDropdownExpanderState> _dynamicExpanderKey =
      GlobalKey<DynamicDropdownExpanderState>();
  TimeOfDay? fromTime;
  TimeOfDay? toTime;

  int timeInMinutes(TimeOfDay time) {
    return (time.hour * 60) + time.minute;
  }

  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      body: Overlay(
        initialEntries: [
          OverlayEntry(
          builder: (context) => SingleChildScrollView(
            key: _scrollableKey,
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 32),
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
                      final int toMinutes = timeInMinutes(toTime!);
          
                      print("Validating selected $selectedMinutes > $toMinutes");
          
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
                      final int fromMinutes = timeInMinutes(toTime!);
          
                      if (selectedMinutes < fromMinutes) {
                        return "Godzina końcowa nie może być mniejsza od początkowej";
                      }
                    },
                  ), // Add the TimePickerWidget
                  const SizedBox(
                      height: 16), // Add space between time picker and calendar
                  HomepageCalendar(),
                  const SizedBox(
                      height: 16), // Add space between time picker and calendar
                  TagsInput(
                    scrollableKey: _scrollableKey,
                    scrollController: _scrollController,
                    dynamicExpanderKey: _dynamicExpanderKey,
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
          ),
        ),]
      ),
    );
  }
}
