import 'package:flutter/material.dart';
import 'package:ummense_app/src/routes/route_list.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';

class AppBarSearch extends StatelessWidget {
  const AppBarSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(8),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.15,
          minWidth: MediaQuery.of(context).size.width * 0.15
        ),
        child: const Icon(
          Icons.search,
          color: ThemeColors.GREY_DARK,
          size: 26,
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, RouteList.searchRoute);
      },
    );
  }
}