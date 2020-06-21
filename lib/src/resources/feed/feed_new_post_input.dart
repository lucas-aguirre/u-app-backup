import 'package:flutter/material.dart';
import 'package:ummense_app/src/routes/route_list.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class FeedNewPostInput extends StatelessWidget {
  const FeedNewPostInput({this.mediaQuery});

  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RouteList.newPostRoute);
        },
        child: Container(
          margin: EdgeInsets.only(
            left: mediaQuery.size.width * 0.05
          ),
          child: const Text(
            'Escrever mensagem',
            style: TextStyle(fontSize: ThemeText.FONT_SIZE_SMALL),
          ),
        ),
      ),
    );
  }
}