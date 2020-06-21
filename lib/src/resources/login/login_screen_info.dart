import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class LoginScreenInfo extends StatelessWidget {
  const LoginScreenInfo({this.sizedBoxHeight});

  final double sizedBoxHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: const Text(
            'Faça o Login',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: ThemeText.FONT_SIZE_LARGE)
          ),
        ),
        SizedBox(height: sizedBoxHeight),
        Container(
          child: const Text(
            'Insira o seu e-mail para continuar.',
            style: TextStyle(fontSize: ThemeText.FONT_SIZE_MEDIUM),
          ),
        ),
      ],
    );
  }
}