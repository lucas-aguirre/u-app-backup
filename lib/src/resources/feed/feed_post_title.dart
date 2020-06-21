import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ummense_app/src/models/post_model.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';
import 'package:ummense_app/src/widgets/images/user_avatar.dart';

class FeedPostTitle extends StatelessWidget {
  const FeedPostTitle({this.widthPadding, this.post});

  final double widthPadding;
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: widthPadding
        ),
        leading: UserAvatar(user: post.user),
        title: Text(
          post.user.name + ' ' + post.user.lastname,
          style: const TextStyle(
            fontSize: ThemeText.FONT_SIZE_MEDIUM,
            fontWeight: FontWeight.bold
          )
        ),
        subtitle: Row(children: <Widget>[
          Expanded(
            child: Wrap(
              children: <Widget>[
                Text(
                  DateFormat("d 'de' MMMM 'às' HH'h'mm", 'pt_BR').format(post.createdAt),
                  style: const TextStyle(
                    fontSize: ThemeText.FONT_SIZE_SMALL,
                    color: ThemeColors.GREY_LIGHT_1
                  )
                ),
                if (post.project != null)
                const Icon(
                    Icons.arrow_right,
                    size: 22,
                    color: ThemeColors.GREY_LIGHT_1,
                  ) else const SizedBox(),
                if (post.project != null)
                Text(
                    post.project.name,
                    style: const TextStyle(
                      color: ThemeColors.GREY_LIGHT_1
                    )
                  ) else const SizedBox()
              ],
            ),
          ),
        ])
      ),
    );
  }
}