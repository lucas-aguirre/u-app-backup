import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ummense_app/src/routes/router.dart';
import 'package:ummense_app/src/routes/route_list.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const UApp());
}

class UApp extends StatelessWidget {
  const UApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'U-App',
      theme: ThemeData(
        iconTheme: const IconThemeData(color: ThemeColors.GREY_DARK),
        fontFamily: 'Segoe-UI',
        backgroundColor: ThemeColors.GREY_LIGHT_4
      ),
      onGenerateRoute: Router.generateRoute,
      initialRoute: RouteList.loadingApp,
    );
  }
}
