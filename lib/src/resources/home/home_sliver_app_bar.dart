import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';
import 'package:ummense_app/src/widgets/app_bar/app_bar_organization_logo.dart';
import 'package:ummense_app/src/widgets/app_bar/app_bar_search.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({
    @required String headerTitle,
    @required TabController tabController,
  })  : _headerTitle = headerTitle,
        _tabController = tabController;

  final String _headerTitle;
  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    //Caso for a tela do feed, habilito o dropdown de filtro
    final bool _isFeedScreen = _tabController.index == 0;

    return SliverAppBar(
      elevation: 0.7,
      forceElevated: true,
      backgroundColor: ThemeColors.GREY_LIGHT_4,
      leading: const AppBarOrganizationLogo(),
      actions: <Widget>[
        const AppBarSearch()
      ],
      title: GestureDetector(
        child: GestureDetector(
          onTap: () {
            if ( _isFeedScreen ) {

            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _headerTitle,
                style: const TextStyle(
                    fontSize: ThemeText.FONT_SIZE_SMALL,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.GREY_BASE),
              ),
              // if ( _isFeedScreen )
                // const Icon(
                //   Icons.arrow_drop_down,
                //   color: ThemeColors.GREY_DARK,
                // )
            ],
          ),
        ),
        onTap: () {},
      )
    );
  }
}
