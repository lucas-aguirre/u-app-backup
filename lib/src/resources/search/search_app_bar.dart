import 'package:flutter/material.dart';
import 'package:ummense_app/src/resources/search/search_app_bar_input.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({this.updateShowPosts});

  final Function updateShowPosts;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ThemeColors.GREY_LIGHT_4,
      title: SearchAppBarInput(updateShowPosts: updateShowPosts, mediaQuery: mediaQuery),
      actions: <Widget>[
        Center(
          child: Container(
            padding: EdgeInsets.only(
              right: mediaQuery.size.width * 0.04,
            ),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  fontSize: ThemeText.FONT_SIZE_SMALL,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.GREY_DARK
                )
              ),
            ),
          ),
        ),
      ],
    );
  }
}