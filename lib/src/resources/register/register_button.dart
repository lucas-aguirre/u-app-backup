import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/widgets/buttons/action_button.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    this.canSubmitData,
    this.makeLogin
  });

  final bool canSubmitData;
  final Function makeLogin;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ActionButton(
        buttonText: const Text('Avançar'),
        textColor: ThemeColors.GREY_LIGHT_4,
        buttonFunction: canSubmitData
        ? () => makeLogin()
        : null,
        buttonColor: canSubmitData ? ThemeColors.BLUE_BASE : ThemeColors.GREY_LIGHT_1,
      ),
    );
  }
}