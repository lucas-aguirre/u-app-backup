import 'package:flutter/material.dart';
import 'package:ummense_app/src/routes/route_list.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeColors.GREY_LIGHT_4,
      elevation: 0.0,
      leading: GestureDetector(
        child: const Icon(Icons.arrow_back, color: ThemeColors.GREY_BASE),
        onTap: () {
          Navigator.pop(context);
        },
      ),

      actions: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RouteList.updateProfileRoute);
          },
          child: Center(
            child: Container(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.04,
              ),
              child: const Text(
                'Editar',
                style: TextStyle(
                  fontSize: ThemeText.FONT_SIZE_SMALL,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.BLUE_BASE
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}