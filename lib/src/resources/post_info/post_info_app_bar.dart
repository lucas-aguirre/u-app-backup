import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class PostInfoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PostInfoAppBar({this.title});
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ThemeColors.GREY_LIGHT_4,
      elevation: 0.2,
      leading: GestureDetector(
        child: const Icon(Icons.arrow_back, color: ThemeColors.GREY_BASE),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: ThemeText.FONT_SIZE_SMALL,
          fontWeight: FontWeight.bold,
          color: ThemeColors.GREY_BASE
        ),
      ),
      centerTitle: true,
    );
  }
}