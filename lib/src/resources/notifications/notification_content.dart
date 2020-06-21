import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class NotificationContent extends StatelessWidget {
  const NotificationContent({this.mediaQuery});

  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Wrap(
          children: <Widget>[
            const Text(
              'Olá Fernando. Hoje tiramos uma linda foto do por do sol na frente da sua...',
              style: TextStyle(
                fontSize: ThemeText.FONT_SIZE_MEDIUM,
                color: ThemeColors.GREY_BASE
              ),
            ),
            SizedBox(height: mediaQuery.size.height * 0.08),
            Text(
              DateFormat("d 'de' MMMM 'às' HH'h'mm", 'pt_BR').format(DateTime.now()),
              style: const TextStyle(
                fontSize: ThemeText.FONT_SIZE_SMALL,
                color: ThemeColors.GREY_LIGHT_1
              ),
            ),
          ],
        ),
      ]
    );
  }
}