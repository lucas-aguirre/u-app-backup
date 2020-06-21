import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/widgets/icons.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    @required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    print(_tabController.index);
    final List<Tab> _tabList = <Tab>[
      Tab(
        icon: _tabController.index == 0
        ? Icon(MyFlutterApp.menu_feed_on)
        : Icon(MyFlutterApp.menu_feed_off),
      ),
      Tab(
        icon: _tabController.index == 1
        ? Icon(MyFlutterApp.menu_bot_on)
        : Icon(MyFlutterApp.menu_bot_off)
      ),
      Tab(
        icon: _tabController.index == 2
        ? Icon(MyFlutterApp.menu_notification_on)
        : Icon(MyFlutterApp.menu_notification_off)
      ),
      Tab(
        icon: _tabController.index == 3
        ? Icon(MyFlutterApp.menu_config_on)
        : Icon(MyFlutterApp.menu_config_off)
      )
    ];

    return TabBar(
      indicatorColor: ThemeColors.BLUE_BASE,
      labelColor: ThemeColors.GREY_DARK,
      tabs: _tabList,
      controller: _tabController,
    );
  }
}
