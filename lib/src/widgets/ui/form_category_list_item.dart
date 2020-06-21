import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class FormCategoryListItem extends StatelessWidget {
  const FormCategoryListItem({
    @required this.icon,
    @required this.name,
    @required this.mediaQuery
  });

  final Icon icon;
  final String name;
  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: mediaQuery.size.height * 0.015),
      width: mediaQuery.size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColors.GREY_LIGHT_2,
          width: 0.8
        ),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Card(
        color: ThemeColors.GREY_LIGHT_4,
        elevation: 0,
        child: ListTile(
          title: Text(
            name,
            style: const TextStyle(fontSize: ThemeText.FONT_SIZE_MEDIUM, fontWeight: FontWeight.bold)
          ),
          leading: icon
        ),
      ),
    );
  }
}