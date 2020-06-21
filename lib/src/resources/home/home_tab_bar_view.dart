import 'package:flutter/material.dart';
import 'package:ummense_app/src/resources/feed/feed_screen.dart';
import 'package:ummense_app/src/resources/notifications/notifications_screen.dart';
import 'package:ummense_app/src/resources/settings/settings_screen.dart';
import 'package:ummense_app/src/resources/ummense_bot/ummense_bot_screen.dart';

class HomeTabBarView extends StatelessWidget {
  const HomeTabBarView({
    @required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetList = <Widget>[
      const FeedScreen(),
      const UmmenseBotScreen(),
      const NotificationsScreen(),
      const SettingsScreen(),
    ];

    return TabBarView(
      children: _widgetList,
      controller: _tabController,
    );
  }
}
