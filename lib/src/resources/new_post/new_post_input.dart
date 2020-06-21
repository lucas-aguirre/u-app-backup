import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';

class NewPostInput extends StatefulWidget {
  const NewPostInput({this.checkIfPostHasContent});

  final Function checkIfPostHasContent;

  @override
  _NewPostInputState createState() => _NewPostInputState();
}

class _NewPostInputState extends State<NewPostInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      onChanged: (String value) => widget.checkIfPostHasContent(value),
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.GREY_LIGHT_4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.GREY_LIGHT_4),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.GREY_LIGHT_4),
        ),
      ),
    );
  }
}