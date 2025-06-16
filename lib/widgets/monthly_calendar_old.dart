import 'package:flutter/material.dart';
import 'package:SeeGestMobileApp/classes/colors.dart';

class MonthlyCalendar extends StatefulWidget {
  final DateTime initialDate;

  const MonthlyCalendar({super.key, required this.initialDate});

  @override
  _MonthlyCalendarState createState() => _MonthlyCalendarState();
}

class _MonthlyCalendarState extends State<MonthlyCalendar> {
  late DateTime _currentDate;
  final List<int> _selectedDays = [];

  @override
  void initState() {
    super.initState();
    _currentDate = widget.initialDate;
  }

  void _previousMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month - 1);
      _selectedDays.clear(); // Clear selected days when changing month
    });
  }

  void _nextMonth() {
    setState(() {
      _currentDate = DateTime(_currentDate.year, _currentDate.month + 1);
      _selectedDays.clear(); // Clear selected days when changing month
    });
  }

  void _toggleDaySelection(int day) {
    setState(() {
      if (_selectedDays.contains(day)) {
        _selectedDays.remove(day);
      } else {
        _selectedDays.add(day);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateTime(_currentDate.year, _currentDate.month + 1, 0).day;
    final firstDayOfMonth = DateTime(_currentDate.year, _currentDate.month, 1).weekday;
    final today = DateTime.now();
    final weeks = <TableRow>[];

    // Add the header row with the days of the week
    weeks.add(
      TableRow(
        children: List.generate(7, (index) {
          return Center(
            child: Text(
              ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'][index],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }),
      ),
    );

    // Add the days of the month
    int day = 1;
    for (int i = 0; i < 6; i++) {
      final days = List<Widget>.generate(7, (index) {
        if (i == 0 && index < firstDayOfMonth - 1 || day > daysInMonth) {
          return const SizedBox.shrink();
        } else {
          final isSelected = _selectedDays.contains(day);
          final isToday = today.year == _currentDate.year &&
                          today.month == _currentDate.month &&
                          today.day == day;
          final currentDay = day; // Capture the current day value
          day++;
          return GestureDetector(
            onTap: () => _toggleDaySelection(currentDay),
            child: Center(
              child: Container(
                width: 24,
                height: 24,
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: isToday
                      ? Colors.red
                      : isSelected
                          ? Colors.blue
                          : Colors.transparent,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Center(
                  child: Text(
                    currentDay.toString(),
                    style: TextStyle(
                      color: isToday || isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
        }
      });
      weeks.add(TableRow(children: days));
    }

    return Container(
      margin: const EdgeInsets.all(1.0), // Add 1px black margin to the whole calendar
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 40, // Set the height to 40px
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding to move arrows closer to center
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: _previousMonth,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),
                    Text(
                      '${_currentDate.year}-${_currentDate.month.toString().padLeft(2, '0')}',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward, color: Colors.black),
                        onPressed: _nextMonth,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32), // Add space between month picker and week days
            Table(
              children: [
                weeks.first,
                TableRow(
                  children: List.generate(7, (_) => const Divider(color: Colors.black)),
                ),
                ...weeks.skip(1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}