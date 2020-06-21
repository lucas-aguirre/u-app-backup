import 'package:flutter/material.dart';
import 'package:ummense_app/src/repositories/user_repository.dart';
import 'package:ummense_app/src/resources/settings/settings_option.dart';
import 'package:ummense_app/src/routes/route_list.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(children: <Widget>[
        Column(
          children: <Widget>[
            SettingsOption(
              optionIcon: const CircleAvatar(backgroundColor: ThemeColors.BLUE_BASE, child: Icon(Icons.person_outline, color: ThemeColors.GREY_LIGHT_4)),
              optionName: const Text(
                'Meus Dados',
                style: TextStyle(fontSize: ThemeText.FONT_SIZE_MEDIUM, fontWeight: FontWeight.bold),
              ),
              optionFunction: () => Navigator.pushNamed(context, RouteList.profileRoute),
            ),
            //TODO notificações
            // SettingsOption(
            //   optionIcon: const CircleAvatar(backgroundColor: ThemeColors.RED_BASE, child: Icon(Icons.notifications_none, color: ThemeColors.GREY_LIGHT_4)),
            //   optionName: const Text(
            //     'Notificações',
            //     style: TextStyle(fontSize: ThemeText.FONT_SIZE_MEDIUM, fontWeight: FontWeight.bold),
            //   ),
            //   optionFunction: () => Navigator.pushNamed(context, RouteList.updateNotificationSettingsRoute),
            // ),
            SettingsOption(
              optionIcon: const CircleAvatar(backgroundColor: ThemeColors.GREY_LIGHT_1, child: Icon(Icons.exit_to_app, color: ThemeColors.GREY_LIGHT_4)),
              optionName: const Text(
                'Sair',
                style: TextStyle(fontSize: ThemeText.FONT_SIZE_MEDIUM, fontWeight: FontWeight.bold),
              ),
              optionFunction: () => UserRepository().logout().then((_) => <void>{
                Navigator.pushNamedAndRemoveUntil(context, RouteList.indexRoute, (Route<dynamic> route) => false)
              })
            ),
          ],
        )
      ]),
    );
  }
}
