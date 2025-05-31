import 'package:SeeGestMobileApp/classes/colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class HomepageCalendar extends StatefulWidget {
  const HomepageCalendar({super.key});

  @override
  State<HomepageCalendar> createState() => _HomepageCalendarState();
}

class _HomepageCalendarState extends State<HomepageCalendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now(); // Initialize focusedDay

  final List<DateTime> _postsDatesList = [
    DateTime(2025, 5, 20),
    DateTime(2025, 5, 26), // dzisiaj
    DateTime(2025, 5, 28),
    DateTime(2025, 6, 5),
  ];

  // Pomocnicza funkcja do sprawdzania czy data ma posty
  bool _hasPostsForDay(DateTime day) {
    return _postsDatesList.any((postDate) =>
        postDate.year == day.year &&
        postDate.month == day.month &&
        postDate.day == day.day);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,
        calendarFormat: CalendarFormat.month,
        availableCalendarFormats: {
          CalendarFormat.month: 'Month',
        },
        // Styling the calendar
        headerStyle: HeaderStyle(
          decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(10.0),
              shape: BoxShape.rectangle),
          headerPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
          titleCentered: true,
          headerMargin: EdgeInsets.only(bottom: 16.0),
          leftChevronMargin: EdgeInsets.zero,
          rightChevronMargin: EdgeInsets.zero,
          leftChevronIcon: Container(
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(
              Icons.chevron_left_rounded,
              color: AppColors.grey,
              size: 32.0,
            ),
          ),
          leftChevronPadding: EdgeInsets.all(8.0),
          rightChevronIcon: Container(
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Icon(
              Icons.chevron_right_rounded,
              color: AppColors.grey,
              size: 32.0,
            ),
          ),
          rightChevronPadding: EdgeInsets.all(8.0),
        ),
        daysOfWeekHeight: 48.0,
        daysOfWeekStyle: DaysOfWeekStyle(
          decoration: BoxDecoration(
            border: BorderDirectional(
              bottom: BorderSide(
                color: AppColors.grey,
                width: 1.0,
              ),
            ),
          ),
          weekdayStyle: TextStyle(color: AppColors.grey),
        ),
        // Dodaj eventLoader dla postów
        calendarStyle: CalendarStyle(
          isTodayHighlighted:
              false, // Wyłącz domyślne podświetlenie - użyjemy buildera
          outsideTextStyle: TextStyle(color: AppColors.lightGrey),
          defaultTextStyle: TextStyle(
            color: AppColors.grey,
          ),
          weekendTextStyle: TextStyle(
            color: AppColors.grey,
          ),
          // Usuń wszystkie decoration - użyj builderów zamiast tego
        ),
        calendarBuilders: CalendarBuilders(
          todayBuilder: (context, day, focusedDay) {
            print("building today: $day");
            bool hasPost = _hasPostsForDay(day);

            return Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                // Jeśli ma post - gradient, jeśli nie - przezroczyste tło
                gradient: hasPost ? AppColors.primaryGradient : null,
                color: hasPost ? null : Colors.transparent,
                border: Border.all(
                  color: AppColors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    // Jeśli ma post i gradient - biały tekst, jeśli nie - szary
                    color: hasPost ? Colors.white : AppColors.grey,
                  ),
                ),
              ),
            );
          },
          selectedBuilder: (context, day, focusedDay) {
            print("building selected: $day");
            return Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
          defaultBuilder: (context, day, focusedDay) {
            bool hasPost = _hasPostsForDay(day);
            bool isToday = day.year == DateTime.now().year &&
                day.month == DateTime.now().month &&
                day.day == DateTime.now().day;

            return Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                gradient: hasPost ? AppColors.primaryGradient : null,
                borderRadius: BorderRadius.circular(8.0),
                border:  isToday ? Border.all(
                  color: AppColors.grey,
                  width: 2.0,
                ) : null
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: TextStyle(color: hasPost ? Colors.white : AppColors.grey),
                ),
              ),
            );
          },
        ),
        // End of calendar styling
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay; // update `_focusedDay` here as well
          });
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
