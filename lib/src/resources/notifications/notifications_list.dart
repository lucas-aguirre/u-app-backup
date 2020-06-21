import 'package:flutter/material.dart';
import 'package:ummense_app/src/resources/notifications/notification_content.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';
import 'package:ummense_app/src/widgets/images/user_avatar.dart';

class NotificationsList extends StatelessWidget {
  const NotificationsList({
    @required this.widthPadding,
    @required this.mediaQuery,
    @required this.wasReaded,
    @required this.avatar,
    this.firstNotification = false,
    this.file,
  });

  final double widthPadding;
  final MediaQueryData mediaQuery;
  final bool wasReaded;
  final String file;
  final bool firstNotification;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: wasReaded ? ThemeColors.GREY_LIGHT_4 : ThemeColors.GREY_LIGHT_3,
      padding: EdgeInsets.only(
        left: widthPadding,
        right: widthPadding,
        bottom: mediaQuery.size.height * 0.03,
        top: firstNotification == true ? mediaQuery.size.height * 0.03 : 0,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: widthPadding),
        leading: const UserAvatar(),
        title: Row(
          children: <Widget>[
            Expanded(
              child: Wrap(
                children: <Widget>[
                  const Text(
                    'Lucas',
                    style: TextStyle(
                      fontSize: ThemeText.FONT_SIZE_SMALL,
                      color: ThemeColors.GREY_LIGHT_1
                    ),
                  ),
                  const Icon(
                    Icons.arrow_right,
                    size: 22,
                    color: ThemeColors.GREY_LIGHT_1,
                  ),
                  const Text(
                    'Projeto legal',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: ThemeText.FONT_SIZE_SMALL,
                      color: ThemeColors.GREY_BASE
                    ),
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.04),
                ],
              ),
            ),
          ],
        ),

        subtitle: NotificationContent(mediaQuery: mediaQuery),
      ),
    );
  }
}
