import 'package:flutter/material.dart';
import 'package:ummense_app/src/routes/route_list.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';
import 'package:ummense_app/src/widgets/buttons/action_button.dart';

class IndexButtons extends StatelessWidget {
  const IndexButtons({this.screenHeight});

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ActionButton(
          buttonText: const Text(
            'Fazer cadastro',
            style: TextStyle(fontSize: ThemeText.FONT_SIZE_MEDIUM),
          ),
          buttonColor: ThemeColors.BLUE_BASE,
          buttonFunction: () {
            Navigator.pushNamed(context, RouteList.registerRoute);
          },
          textColor: ThemeColors.GREY_LIGHT_4,
        ),
        SizedBox(height: screenHeight * 0.02,),
        ActionButton(
          buttonText: const Text(
            'Entrar',
            style: TextStyle(fontSize: ThemeText.FONT_SIZE_MEDIUM),
          ),
          buttonColor: ThemeColors.TRANSPARENT,
          buttonFunction: () {
            Navigator.pushNamed(context, RouteList.loginRoute);
          },
          textColor: ThemeColors.GREY_LIGHT_4,
          borderColor: ThemeColors.GREY_LIGHT_4
        )
      ],
    );
  }
}