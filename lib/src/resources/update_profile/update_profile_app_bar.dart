import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class UpdateProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UpdateProfileAppBar();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeColors.GREY_LIGHT_4,
      elevation: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  fontSize: ThemeText.FONT_SIZE_SMALL,
                  color: ThemeColors.BLUE_BASE
                )
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: const Text(
                'Salvar',
                style: TextStyle(
                  fontSize: ThemeText.FONT_SIZE_SMALL,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.BLUE_BASE
                ),
              ),
            ),
          )
        ],
      ),
      automaticallyImplyLeading: false,
    );
  }
}