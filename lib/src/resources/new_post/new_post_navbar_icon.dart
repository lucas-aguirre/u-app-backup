
import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';

class NewPostNavbarIcon extends StatelessWidget {
  const NewPostNavbarIcon({
    @required this.mediaQuery,
    @required this.onTap,
    @required this.icon
  });

  final MediaQueryData mediaQuery;
  final Function onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaQuery.size.height * 0.08,
      width: mediaQuery.size.width * 0.25,
      decoration: BoxDecoration(
        border: Border.all(color: ThemeColors.GREY_LIGHT_2)
      ),
      child: Center(
        child: icon
      )
    );
  }
}