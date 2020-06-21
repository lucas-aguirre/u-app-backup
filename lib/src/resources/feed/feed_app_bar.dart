import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';
import 'package:ummense_app/src/widgets/app_bar/app_bar_organization_logo.dart';
import 'package:ummense_app/src/widgets/app_bar/app_bar_search.dart';

class FeedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FeedAppBar();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetList = <Widget>[const AppBarSearch()];

    return AppBar(
      elevation: 0.7,
      backgroundColor: ThemeColors.GREY_LIGHT_4,
      leading: const AppBarOrganizationLogo(),
      title: const Text(
        'Todos',
        style: TextStyle(
            fontSize: ThemeText.FONT_SIZE_SMALL,
            fontWeight: FontWeight.bold,
            color: ThemeColors.GREY_BASE),
      ),
      centerTitle: true,
      actions: _widgetList,
    );
  }
}
