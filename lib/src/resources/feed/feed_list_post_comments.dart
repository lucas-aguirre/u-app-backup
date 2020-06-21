import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ummense_app/src/models/post_model.dart';
import 'package:ummense_app/src/resources/feed/feed_post_file.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';
import 'package:ummense_app/src/widgets/images/user_avatar.dart';

class FeedListPostComments extends StatelessWidget {
  const FeedListPostComments({this.postComments});

  final List<PostModel> postComments;

  String diffInDays(PostModel comment) {
    final now = DateTime.now();
    final diff = now.difference(comment.createdAt);

    if ( diff.inDays > 0 ) {
      return 'Há ' + diff.inDays.toString() + ' dia(s)';
    }

    return 'Hoje';
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (PostModel comment in postComments)
          Container(
            child: ListTile(
              leading: UserAvatar(user: comment.user),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FeedPostFile(mediaQuery: mediaQuery, post: comment, isComment: true),
                  Text(diffInDays(comment)),
                ],
              ),
              title: Html(
                data: comment.description,
                backgroundColor: ThemeColors.GREY_LIGHT_4,
                defaultTextStyle: const TextStyle(fontSize: ThemeText.FONT_SIZE_SMALL),
              ),
            ),
          )
        ],
      )
    );
  }
}