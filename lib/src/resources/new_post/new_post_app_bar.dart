import 'package:flutter/material.dart';
import 'package:ummense_app/src/routes/route_list.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class NewPostAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewPostAppBar({
    this.mediaQuery,
    this.actionLinkText,
    this.canAdvanceStep,
    this.advanceStep,
  });

  final MediaQueryData mediaQuery;
  final String actionLinkText;
  final bool canAdvanceStep;
  final Function advanceStep;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.7,
      backgroundColor: ThemeColors.GREY_LIGHT_4,
      leading: GestureDetector(onTap: () => Navigator.pushNamedAndRemoveUntil(context, RouteList.homeRoute, (Route<dynamic> route) => false), child: const Icon(Icons.arrow_back, color: ThemeColors.GREY_DARK)),
      centerTitle: true,
      title: const Text(
        'Criar publicação',
        style: TextStyle(
            fontSize: ThemeText.FONT_SIZE_SMALL,
            fontWeight: FontWeight.bold,
            color: ThemeColors.GREY_DARK
          )
      ),
      actions: <Widget>[
        Center(
          child: Container(
            padding: EdgeInsets.only(
              right: mediaQuery.size.width * 0.04,
            ),
            child: GestureDetector(
              onTap: () {
                if ( canAdvanceStep ) {
                  advanceStep();
                }
              },
              child: Text(
                actionLinkText,
                style: TextStyle(
                  fontSize: ThemeText.FONT_SIZE_SMALL,
                  fontWeight: FontWeight.bold,
                  color: canAdvanceStep == true ? ThemeColors.BLUE_BASE : ThemeColors.GREY_LIGHT_1
                )
              ),
            ),
          ),
        ),
      ],
    );
  }
}