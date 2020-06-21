
import 'package:flutter/material.dart';

class InputTextArea extends StatefulWidget {
  const InputTextArea();

  @override
  _InputTextAreaState createState() => _InputTextAreaState();
}

class _InputTextAreaState extends State<InputTextArea> {
  @override
  Widget build(BuildContext context) {
    return const TextField(
      minLines: 4,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(hintText: 'Digite seu texto aqui', labelText: 'Text area'),
    );
  }
}