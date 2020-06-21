
import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  const InputText();

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      maxLines: 1,
      decoration: InputDecoration(hintText: 'Digite seu texto aqui', labelText: 'Text input'),
    );
  }
}