import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/styled_input.dart';
import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({super.key});

  @override
  _TimePickerWidgetState createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay _selectedTime = TimeOfDay.now();
  TextEditingController _timeController = TextEditingController();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      helpText: "Do Godziny",
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
        _timeController.text = _selectedTime.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        StyledInput(labelText: 'Do Godziny', hintText: 'Wybierz godzinę', onTap: () => _selectTime(context), readOnly: true, controller: _timeController,),
      ],
    );
  }
}