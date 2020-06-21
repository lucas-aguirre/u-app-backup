import 'package:flutter/material.dart';
import 'package:ummense_app/src/resources/organization/organization_list_info.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';

class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height * 0.5,
            child: const Image(
              image: AssetImage('assets/images/organization/wallpaper.png'),
              fit: BoxFit.cover,
            )
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: mediaQuery.size.height * 0.3,
                leading: GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    constraints: BoxConstraints(
                        maxWidth: mediaQuery.size.width * 0.15,
                        minWidth: mediaQuery.size.width * 0.15
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: ThemeColors.GREY_LIGHT_4,
                      size: 26,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                actions: <Widget>[
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      constraints: BoxConstraints(
                          maxWidth: mediaQuery.size.width * 0.15,
                          minWidth: mediaQuery.size.width * 0.15
                      ),
                      child: const Icon(
                        Icons.search,
                        color: ThemeColors.GREY_LIGHT_4,
                        size: 26,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'search-post');
                    },
                  )
                ],
              ),
              OrganizationListInfo(mediaQuery: mediaQuery),
            ],
        )]
      )
    );
  }
}
