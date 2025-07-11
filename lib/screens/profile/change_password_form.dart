import 'package:SeeGestMobileApp/controllers/user_controller.dart';
import 'package:SeeGestMobileApp/shared/styled_button.dart';
import 'package:SeeGestMobileApp/shared/styled_input.dart';
import 'package:SeeGestMobileApp/shared/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChangePasswordForm extends ConsumerStatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangePasswordFormState();
}

class _ChangePasswordFormState extends ConsumerState<ChangePasswordForm> {
  final GlobalKey<FormState> _passwordChangeKey = GlobalKey<FormState>();

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _newRepeatedPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _passwordChangeKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StyledHeadingText("Zmień hasło"),
          const SizedBox(
            height: 16,
          ),
          StyledFormInput(
            labelText: "Stare hasło",
            hintText: "Podaj stare hasło",
            controller: _oldPasswordController,
            validator: (value) {
              if (value?.isEmpty == null || value!.isEmpty) {
                return "Pole nie może być puste";
              }
              return null;
            },
            obscureText: true,
          ),
          const SizedBox(
            height: 8,
          ),
          StyledFormInput(
            labelText: "Nowe hasło",
            hintText: "Wpisz Nowe hasło",
            controller: _newPasswordController,
            validator: (value) {
              if (value?.isEmpty == null || value!.isEmpty) {
                return "Pole nie może być puste";
              }
              return null;
            },
            obscureText: true,
          ),
          const SizedBox(
            height: 8,
          ),
          StyledFormInput(
            labelText: "Powtórz nowe hasło",
            hintText: "Wpisz ponownie nowe hasło",
            controller: _newRepeatedPasswordController,
            validator: (value) {
              if (value?.isEmpty == null || value!.isEmpty) {
                return "Pole nie może być puste";
              }
              if (value != _newPasswordController.text) {
                return "Hasła muszą być identyczne";
              }
              return null;
            },
            obscureText: true,
          ),
          const SizedBox(
            height: 16,
          ),
          StyledFilledButton(
            text: "Zresetuj hasło",
            icon: FontAwesomeIcons.lock,
            callback: () async {
              if (context.mounted &&
                  _passwordChangeKey?.currentState != null &&
                  _passwordChangeKey!.currentState!.validate()) {
                final bool success = await UserController.changePassword(
                    _oldPasswordController.text,
                    _newPasswordController.text,
                    _newRepeatedPasswordController.text);

                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(success ? "Hasło zostało pomyślnie zresetowane" : "Wystąpił błąd")));

                if(success) {
                  _passwordChangeKey.currentState!.reset();
                }
              }
            },
          )
        ],
      ),
    );
  }
}
