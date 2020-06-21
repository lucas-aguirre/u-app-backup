import 'package:flutter/material.dart';
import 'package:ummense_app/src/resources/index/index_buttons.dart';
import 'package:ummense_app/src/resources/index/index_logo.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen();

  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;
    final double _screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: _screenHeight,
      width: _screenWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/organization/wallpaper.png'),
          fit: BoxFit.cover,
        )
      ),
      padding: EdgeInsets.only(
        top: _screenWidth * 0.2,
        bottom: _screenWidth * 0.1,
        left: _screenHeight * 0.05,
        right: _screenHeight * 0.05,
      ),
      child: Column(
        children: <Widget>[
          IndexLogo(screenHeight: _screenHeight),
          SizedBox(height: _screenHeight * 0.15),
          IndexButtons(screenHeight: _screenHeight),
        ],
      ),
    );
  }
}