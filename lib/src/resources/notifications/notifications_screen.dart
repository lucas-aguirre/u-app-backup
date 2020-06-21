import 'package:flutter/material.dart';
import 'package:ummense_app/src/resources/notifications/notifications_list.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double widthPadding = mediaQuery.size.width * 0.015;

    return Scaffold(
      body: ListView(
        children: <Widget>[
          NotificationsList(widthPadding: widthPadding, mediaQuery: mediaQuery, wasReaded: false, firstNotification: true, avatar: 'assets/images/temp/Avatar1.png'),
          NotificationsList(widthPadding: widthPadding, mediaQuery: mediaQuery, wasReaded: false, avatar: 'assets/images/temp/Avatar2.png'),
          NotificationsList(widthPadding: widthPadding, mediaQuery: mediaQuery, wasReaded: false, avatar: 'assets/images/temp/Avatar2.png', file: 'teste',),
          NotificationsList(widthPadding: widthPadding, mediaQuery: mediaQuery, wasReaded: true, avatar: 'assets/images/temp/Avatar4.png'),
          NotificationsList(widthPadding: widthPadding, mediaQuery: mediaQuery, wasReaded: true, avatar: 'assets/images/temp/Avatar4.png', file: 'teste'),
          NotificationsList(widthPadding: widthPadding, mediaQuery: mediaQuery, wasReaded: true, avatar: 'assets/images/temp/Avatar3.png', file: 'teste'),
          NotificationsList(widthPadding: widthPadding, mediaQuery: mediaQuery, wasReaded: true, avatar: 'assets/images/temp/Avatar2.png', file: 'teste'),
        ],
      ),
    );
  }
}

