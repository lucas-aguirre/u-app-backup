import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class ProfileListInfo extends StatelessWidget {
  const ProfileListInfo({this.infoName, this.infoValue});

  final String infoName;
  final String infoValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          infoName,
          style: const TextStyle(fontSize: ThemeText.FONT_SIZE_SMALL, color: ThemeColors.GREY_LIGHT_1),
        ),
        subtitle: Text(
          infoValue,
          style: const TextStyle(fontSize: ThemeText.FONT_SIZE_SMALL, color: ThemeColors.GREY_BASE),
        ),
      )
    );
  }
}