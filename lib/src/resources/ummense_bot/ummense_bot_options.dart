import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';
import 'package:ummense_app/src/widgets/ui/form_category_list_item.dart';

class UmmenseBotOptions extends StatelessWidget {
  const UmmenseBotOptions({this.mediaQuery});

  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          child: const Text(
            'Você deseja falar com',
            style: TextStyle(fontSize: ThemeText.FONT_SIZE_MEDIUM, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          child: const Text(
            'qual desses setores?',
            style: TextStyle(fontSize: ThemeText.FONT_SIZE_MEDIUM, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),

        SizedBox(
          height: mediaQuery.size.height * 0.05,
        ),

        FormCategoryListItem(name: 'RH', icon: Icon(Icons.people, color: ThemeColors.BLUE_BASE,), mediaQuery: mediaQuery),
        FormCategoryListItem(name: 'TI - Internet, computadores e sistemas', icon: Icon(Icons.desktop_windows, color: ThemeColors.BLUE_LIGHT_3,), mediaQuery: mediaQuery),
        FormCategoryListItem(name: 'Serviços de manutenção predial', icon: Icon(Icons.business, color: ThemeColors.GREEN_BASE,), mediaQuery: mediaQuery),
        FormCategoryListItem(name: 'Marketing', icon: Icon(Icons.data_usage, color: ThemeColors.YELLOW_BASE,), mediaQuery: mediaQuery),
        FormCategoryListItem(name: 'Apoio Pastoral', icon: Icon(Icons.voicemail, color: ThemeColors.RED_LIGHT_2,), mediaQuery: mediaQuery),
        FormCategoryListItem(name: 'Suporte', icon: Icon(Icons.help, color: ThemeColors.BLUE_DARK,), mediaQuery: mediaQuery),
        // new BotIntroduction(),
      ],
    );
  }
}