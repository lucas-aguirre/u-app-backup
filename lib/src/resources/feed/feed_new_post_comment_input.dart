import 'package:flutter/material.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/widgets/images/user_avatar.dart';

class FeedNewPostCommentInput extends StatefulWidget {
  const FeedNewPostCommentInput();

  @override
  _FeedNewPostCommentInputState createState() => _FeedNewPostCommentInputState();
}

class _FeedNewPostCommentInputState extends State<FeedNewPostCommentInput> {
  @override
  Widget build(BuildContext context) {

    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: mediaQuery.size.width * 0.045,
        vertical: mediaQuery.size.width * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const UserAvatar(),
          Expanded(
            child: Container(
              height: mediaQuery.size.height * 0.07,
              padding: EdgeInsets.only(left: mediaQuery.size.width * 0.025),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  hintText: '',
                  labelStyle: const TextStyle(color: ThemeColors.GREY_LIGHT_1),
                  labelText: 'Adicione um comentário',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: ThemeColors.GREY_LIGHT_4),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: ThemeColors.GREY_LIGHT_4),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
