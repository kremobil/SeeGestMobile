import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AddPostCalendar extends StatefulWidget {
  @override
  _AddPostCalendarState createState() => _AddPostCalendarState();
}

class _AddPostCalendarState extends State<AddPostCalendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Date'),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
          ),
          SizedBox(height: 20),
          Text(
            'Selected Date: ${_selectedDay.toLocal()}'.split(' ')[0],
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}