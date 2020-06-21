import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class UpdateNotificationSettingsScreen extends StatefulWidget {
  const UpdateNotificationSettingsScreen();

  @override
  _UpdateNotificationSettingsScreenState createState() => _UpdateNotificationSettingsScreenState();
}

class _UpdateNotificationSettingsScreenState extends State<UpdateNotificationSettingsScreen> {

  bool _songsOption = false;
  bool _vibrationOption = false;
  bool _showPreview = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.GREY_LIGHT_4,
        elevation: 0.0,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back, color: ThemeColors.GREY_BASE),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Notificações',
          style: TextStyle(
            fontSize: ThemeText.FONT_SIZE_SMALL,
            fontWeight: FontWeight.bold,
            color: ThemeColors.GREY_BASE,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
      children: <Widget>[
        ListTile(
          title: const Text('Sons'),
          trailing: Switch(
            value: _songsOption,
            onChanged: (bool val) {
              setState(() {
                _songsOption = val;
              });
            },
            activeColor: ThemeColors.GREEN_BASE,
          ),
        ),

        ListTile(
          title: const Text('Vibrar'),
          trailing: Switch(
            value: _vibrationOption,
            onChanged: (bool val) {
              setState(() {
                _vibrationOption = val;
              });
            },
            activeColor: ThemeColors.GREEN_BASE,
          ),
        ),

        ListTile(
          title: const Text('Mostrar pré-visualização'),
          subtitle: const Text('Pré-visualizar mensagem de texto nas notificações de nova mensagem.'),
          trailing: Switch(
            value: _showPreview,
            onChanged: (bool val) {
              setState(() {
                _showPreview = val;
              });
            },
            activeColor: ThemeColors.GREEN_BASE,
          ),
        )
      ],
    )
  );
  }
}