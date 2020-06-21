import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';

class RegisterCodeInput extends StatefulWidget {
  const RegisterCodeInput({this.updateInputValue, this.inputValue, this.labelText});

  final Function updateInputValue;
  final String inputValue;
  final String labelText;

  @override
  RegisterCodeInputState createState() => RegisterCodeInputState();
}

class RegisterCodeInputState extends State<RegisterCodeInput> {
  final TextEditingController _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder _inputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: ThemeColors.GREY_LIGHT_2),
      borderRadius: BorderRadius.circular(7),
    );

    final InputDecoration _inputDecoration = InputDecoration(
      contentPadding: const EdgeInsets.all(20.0),
      labelText: widget.labelText,
      labelStyle: const TextStyle(color: ThemeColors.GREY_DARK),
      enabledBorder: _inputBorder,
      focusedBorder: _inputBorder,
      border: _inputBorder,
    );

    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: _inputController,
      onChanged: (String value) => widget.updateInputValue(_inputController.text),
      decoration: _inputDecoration,
    );
  }
}