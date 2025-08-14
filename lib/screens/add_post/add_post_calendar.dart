import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AddPostCalendar extends StatefulWidget {
  const AddPostCalendar({super.key, required this.onDatetimeSelected, this.initialDate});
  
  final void Function(DateTime) onDatetimeSelected;
  final DateTime? initialDate;

  @override
  _AddPostCalendarState createState() => _AddPostCalendarState();
}

class _AddPostCalendarState extends State<AddPostCalendar> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    if (widget.initialDate != null) {
      _selectedDay = widget.initialDate!;
      _focusedDay = widget.initialDate!;
      _selectedTime = TimeOfDay.fromDateTime(widget.initialDate!);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      helpText: "Godzina",
      cancelText: "Anuluj",
      confirmText: "Wybierz",
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.mainColor,
            colorScheme: ColorScheme.light(primary: AppColors.mainColor),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });

      widget.onDatetimeSelected(DateTime(
        _selectedDay.year,
        _selectedDay.month,
        _selectedDay.day,
        _selectedTime.hour,
        _selectedTime.minute,
      ));
    }
  }

    

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.mainColor,
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
                  color: AppColors.mainColor,
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
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: AppColors.mainColor,
                  size: 32.0,
                ),
              ),
              leftChevronPadding: EdgeInsets.all(8.0),
              rightChevronIcon: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(
                  Icons.chevron_right_rounded,
                  color: AppColors.mainColor,
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
                    color: AppColors.mainColor,
                    width: 1.0,
                  ),
                ),
              ),
              weekdayStyle: TextStyle(color: AppColors.mainColor),
            ),
            // Dodaj eventLoader dla postów
            calendarStyle: CalendarStyle(
              isTodayHighlighted:
                  false, // Wyłącz domyślne podświetlenie - użyjemy buildera
              outsideTextStyle: TextStyle(color: AppColors.secondaryColor),
              defaultTextStyle: TextStyle(
                color: AppColors.mainColor,
              ),
              weekendTextStyle: TextStyle(
                color: AppColors.mainColor,
              ),
              // Usuń wszystkie decoration - użyj builderów zamiast tego
            ),
            calendarBuilders: CalendarBuilders(
              todayBuilder: (context, day, focusedDay) {
                print("building today: $day");

                return Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    // Jeśli ma post - gradient, jeśli nie - przezroczyste tło
                    color: Colors.transparent,
                    border: Border.all(
                      color: AppColors.mainColor,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: TextStyle(
                        // Jeśli ma post i gradient - biały tekst, jeśli nie - szary
                        color: AppColors.mainColor,
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
                    color: AppColors.mainColor,
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
              headerTitleBuilder: (context, day) {
                final monthNames = [
                  'Styczeń',
                  'Luty',
                  'Marzec',
                  'Kwiecień',
                  'Maj',
                  'Czerwiec',
                  'Lipiec',
                  'Sierpień',
                  'Wrzesień',
                  'Październik',
                  'Listopad',
                  'Grudzień',
                ];

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        _selectTime(context);
                      },
                      child: Text(_selectedTime.format(context),
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Text('${monthNames[day.month - 1]} ${day.year}',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                );
              },
              defaultBuilder: (context, day, focusedDay) {
                bool isToday = day.year == DateTime.now().year &&
                    day.month == DateTime.now().month &&
                    day.day == DateTime.now().day;

                return Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: isToday
                          ? Border.all(
                              color: AppColors.mainColor,
                              width: 2.0,
                            )
                          : null),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: TextStyle(color: AppColors.mainColor),
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

              widget.onDatetimeSelected(DateTime(
                selectedDay.year,
                selectedDay.month,
                selectedDay.day,
                _selectedTime.hour,
                _selectedTime.minute,
              ));
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
        ),
      ],
    );
  }
}
