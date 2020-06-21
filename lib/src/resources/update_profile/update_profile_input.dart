import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class UpdateProfileInput extends StatefulWidget {
  const UpdateProfileInput({this.label});
  final String label;

  @override
  _UpdateProfileInputState createState() => _UpdateProfileInputState();
}

class _UpdateProfileInputState extends State<UpdateProfileInput> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.02,
        ),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: ThemeColors.GREY_LIGHT_4,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: ThemeColors.GREY_LIGHT_1),
            ),
            labelText: widget.label,
            labelStyle: const TextStyle(fontSize: ThemeText.FONT_SIZE_SMALL, color: ThemeColors.GREY_LIGHT_1),
          ),
        ),
      ),
    );
  }
}