import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    @required this.buttonText,
    @required this.buttonColor,
    @required this.buttonFunction,
    @required this.textColor,
    this.borderColor = Colors.transparent
  });

  final Text buttonText;
  final Color buttonColor;
  final Function buttonFunction;
  final Color textColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      return ButtonTheme(
        minWidth: constraints.maxWidth,
        height: 50,
        child: FlatButton(
          child: buttonText,
          textColor: textColor,
          color: buttonColor,
          onPressed: () => buttonFunction(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: BorderSide(
              color: borderColor,
              width: 0.5
            ),
          ),
        ),
      );
    });
  }
}