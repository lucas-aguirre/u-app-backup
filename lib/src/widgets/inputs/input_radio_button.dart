import 'package:flutter/material.dart';

class InputRadioButton extends StatefulWidget {
  const InputRadioButton();

  @override
  _InputRadioButtonState createState() => _InputRadioButtonState();
}

class _InputRadioButtonState extends State<InputRadioButton> {
  dynamic _radioButtonValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio<dynamic>(
          value: 0,
          groupValue: _radioButtonValue,
          onChanged: (dynamic value) {
            setState(() {
              _radioButtonValue = value;
            });
          },
        ),
        const Text(
          'Opção 1'
        ),
        Radio<dynamic>(
          value: 1,
          groupValue: _radioButtonValue,
          onChanged: (dynamic value) {
            setState(() {
              _radioButtonValue = value;
            });
          },
        ),
        const Text(
          'Opção 2'
        ),
        Radio<dynamic>(
          value: 2,
          groupValue: _radioButtonValue,
          onChanged: (dynamic value) {
            setState(() {
              _radioButtonValue = value;
            });
          },
        ),
        const Text(
          'Opção 3'
        ),
      ],
    );
  }
}
