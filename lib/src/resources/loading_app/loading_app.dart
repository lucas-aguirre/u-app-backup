import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ummense_app/src/routes/route_list.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';

class LoadingApp extends StatelessWidget {
  const LoadingApp();

  Future<String> getInitialRoute() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('user') == false ? RouteList.indexRoute : RouteList.homeRoute;
  }

  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;
    final double _screenWidth = MediaQuery.of(context).size.width;

    Future<void>.delayed(const Duration(milliseconds: 1500), () {
      getInitialRoute().then((String initialRoute) {
        Navigator.pushNamedAndRemoveUntil(context, initialRoute, (Route<dynamic> route) => false);
      });
    });

    return Container(
      height: _screenHeight,
      width: _screenWidth,
      color: Colors.white,
      child: SpinKitThreeBounce(
        color: ThemeColors.BLUE_BASE,
        size: 50.0,
      ),
    );
  }
}