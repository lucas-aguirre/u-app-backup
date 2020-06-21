import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';

class LoginCodeInput extends StatefulWidget {
  const LoginCodeInput({this.updateEmailValue, this.phoneNumber});

  final Function updateEmailValue;
  final String phoneNumber;

  @override
  LoginCodeInputState createState() => LoginCodeInputState();
}

class LoginCodeInputState extends State<LoginCodeInput> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder _inputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: ThemeColors.GREY_LIGHT_2),
      borderRadius: BorderRadius.circular(7),
    );

    final InputDecoration _inputDecoration = InputDecoration(
      contentPadding: const EdgeInsets.all(20.0),
      labelText: 'Adicionar e-mail',
      labelStyle: const TextStyle(color: ThemeColors.GREY_DARK),
      enabledBorder: _inputBorder,
      focusedBorder: _inputBorder,
      border: _inputBorder,
    );

    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: _emailController,
      onChanged: (String value) => widget.updateEmailValue(_emailController.text),
      decoration: _inputDecoration,
    );
  }
}