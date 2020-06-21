import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';

class SettingsOption extends StatelessWidget {
  const SettingsOption({this.optionIcon, this.optionName, this.optionFunction});

  final CircleAvatar optionIcon;
  final Text optionName;
  final Function optionFunction;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    final double widthPadding = mediaQuery.size.width * 0.045;
    final double heightPadding = mediaQuery.size.height * 0.005;
    const double settingOptionPadding = 3;

    return GestureDetector(
      onTap: () => optionFunction(),
      child: Container(
        padding: const EdgeInsets.all(settingOptionPadding),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ThemeColors.GREY_LIGHT_2)
          )
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: widthPadding, vertical: heightPadding),
          leading: optionIcon,
          title: optionName,
          trailing: const Icon(Icons.keyboard_arrow_right, color: ThemeColors.GREY_LIGHT_1),
        )
      ),
    );
  }
}