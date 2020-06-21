import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class OrganizationInfo extends StatelessWidget {
  const OrganizationInfo({
    this.title,
    this.showDivider,
    this.subtitle
  });

  final String title;
  final String subtitle;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: title != null
          ? Text(
            title,
            style: const TextStyle(
              fontSize: ThemeText.FONT_SIZE_SMALL,
              color: ThemeColors.GREY_LIGHT_1
            ),
          )
          : null,
          subtitle: subtitle != null
          ? Text(
            subtitle,
            style: const TextStyle(
              fontSize: ThemeText.FONT_SIZE_SMALL,
              color: ThemeColors.GREY_BASE
            ),
          )
          : null,
        ),
        if ( showDivider == true )
        const Divider(color: ThemeColors.GREY_LIGHT_2),
      ]
    );
  }
}