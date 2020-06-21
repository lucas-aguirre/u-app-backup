import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class RegisterInvalidCodeMessage extends StatelessWidget {
  const RegisterInvalidCodeMessage({this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    return Container(
      width: _mediaQuery.size.width,
      height: _mediaQuery.size.height * 0.08,
      decoration: BoxDecoration(
        border: Border.all(color: ThemeColors.RED_BASE, width: 1)
      ),
      child: Center(
        child: Text(
          message,
          style: TextStyle(
            color: ThemeColors.RED_BASE,
            fontWeight: FontWeight.bold,
            fontSize: ThemeText.FONT_SIZE_SMALL
          ),
        ),
      ),
    );
  }
}