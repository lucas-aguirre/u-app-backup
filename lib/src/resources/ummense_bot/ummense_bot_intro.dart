import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class UmmenseBotIntroduction extends StatelessWidget {
  const UmmenseBotIntroduction();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: const Image(
            image: AssetImage('assets/images/ummense_bot/Ummi.png'),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        const Text(
          'Olá Lucas',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: ThemeText.FONT_SIZE_MEDIUM, fontWeight: FontWeight.bold),
        ),
        const Text(
          'Sou a Ummi! Estou aqui para te ajudar no contato com os Ummanos ;)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: ThemeText.FONT_SIZE_MEDIUM),
        ),
      ],
    );
  }
}