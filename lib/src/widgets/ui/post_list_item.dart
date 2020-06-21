import 'package:flutter/material.dart';
import 'package:ummense_app/src/models/post_model.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class PostItemList extends StatelessWidget {
  const PostItemList({this.post});

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
      constraints: BoxConstraints(
        minHeight: mediaQuery.size.height * 0.14,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: mediaQuery.size.width * 0.04
      ),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: ThemeColors.GREY_LIGHT_2))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Align(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: mediaQuery.size.height * 0.025
                ),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: ThemeColors.BLUE_BASE,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            )
          ),
          Flexible(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(
                left: mediaQuery.size.height * 0.025,
                top: mediaQuery.size.height * 0.025,
                bottom: mediaQuery.size.height * 0.025
              ),
              child: Container(
                child: Text(
                  post.description != null && post.description.isNotEmpty ? post.description : '',
                  style: const TextStyle(fontSize: ThemeText.FONT_SIZE_SMALL),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}