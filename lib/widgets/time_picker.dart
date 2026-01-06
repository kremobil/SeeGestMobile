import 'dart:math';

import 'package:SeeGestMobileApp/seegest_theme.dart';
import 'package:SeeGestMobileApp/shared/styled_input.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget(
      {super.key,
      required this.labelText,
      required this.onTimeSelected,
      this.validator});

  final String labelText;
  final void Function(TimeOfDay) onTimeSelected;
  final String? Function(TimeOfDay)? validator;

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
    if (picked != null) {
      final String? errorMessage =
          widget.validator != null ? widget.validator!(picked) : null;

      if (errorMessage != null) {
        print(errorMessage);
        if (context.mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(errorMessage, textAlign: TextAlign.center,)));
        }

        return;
      }

      widget.onTimeSelected(picked);

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
        StyledInput(
          labelText: widget.labelText,
          hintText: 'Wybierz godzinę',
          prefixIcon: Icon(
            FontAwesomeIcons.clock,
          ),
          onTap: () => _selectTime(context),
          readOnly: true,
          controller: _timeController,
        ),
      ],
    );
  }
}
