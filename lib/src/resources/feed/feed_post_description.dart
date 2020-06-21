import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ummense_app/src/models/post_model.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class FeedPostDescription extends StatelessWidget {
  const FeedPostDescription({this.widthPadding, this.mediaQuery, this.post});

  final double widthPadding;
  final MediaQueryData mediaQuery;
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(
        left: widthPadding,
        right: widthPadding,
        top: mediaQuery.size.height * 0.015,
      ),
      width: mediaQuery.size.width,
      child: Html(
        data: post.description,
        backgroundColor: ThemeColors.GREY_LIGHT_4,
        defaultTextStyle: const TextStyle(fontSize: ThemeText.FONT_SIZE_SMALL),
      ),
    );
  }
}