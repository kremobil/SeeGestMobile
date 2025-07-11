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


  @override
  Widget build(BuildContext context) {
    return DashboardLayout(
      body: SingleChildScrollView(
          key: _scrollableKey,
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                TimePickerWidget(), // Add the TimePickerWidget
                const SizedBox(
                    height: 32), // Add space between time picker and calendar
                HomepageCalendar(),
                TagsInput(
                  scrollableKey: _scrollableKey,
                  scrollController: _scrollController,
                  dynamicExpanderKey: _dynamicExpanderKey,
                ),
                DynamicDropdownExpander(
                  key: _dynamicExpanderKey,
                ),
                SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ),
    );
  }
}