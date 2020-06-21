import 'package:flutter/material.dart';
import 'package:ummense_app/src/resources/ummense_bot/ummense_bot_intro.dart';
import 'package:ummense_app/src/resources/ummense_bot/ummense_bot_options.dart';

class UmmenseBotScreen extends StatefulWidget {
  const UmmenseBotScreen();

  @override
  _UmmenseBotScreenState createState() => _UmmenseBotScreenState();
}

class _UmmenseBotScreenState extends State<UmmenseBotScreen> {
  Widget _widgetToShow = const UmmenseBotIntroduction();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: GestureDetector(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: _mediaQuery.size.width * 0.05,
            vertical: _mediaQuery.size.height * 0.05
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: _widgetToShow,
          )
        ),

        onTap: () {
          setState(() {
            _widgetToShow = UmmenseBotOptions(mediaQuery: _mediaQuery,);
          });
        },
      ),
    );
  }
}