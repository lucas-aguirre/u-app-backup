import 'package:flutter/material.dart';
import 'package:ummense_app/src/models/post_model.dart';
import 'package:ummense_app/src/resources/feed/feed_list_post_comments.dart';
import 'package:ummense_app/src/resources/feed/feed_new_post_comment_input.dart';
import 'package:ummense_app/src/resources/feed/feed_post_description.dart';
import 'package:ummense_app/src/resources/feed/feed_post_file.dart';
import 'package:ummense_app/src/resources/feed/feed_post_title.dart';
import 'package:ummense_app/src/resources/post_info/post_info_screen.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';

class PostInfo extends StatelessWidget {
  const PostInfo({this.post, this.widthPadding, this.mediaQuery, this.limitComments});
  final PostModel post;
  final double widthPadding;
  final MediaQueryData mediaQuery;
  final bool limitComments;

  void _checkPost(dynamic context) {
    if ( limitComments ) {
      Navigator.push(
        context,
        MaterialPageRoute<dynamic>(
          builder: (dynamic context) => PostInfoScreen(post: post),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _checkPost(context),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FeedPostTitle(widthPadding: widthPadding, post: post),

            if ( post.description != null && post.description.isNotEmpty )
            FeedPostDescription(widthPadding: widthPadding, mediaQuery: mediaQuery, post: post),

            if ( post.file != null )
            FeedPostFile(mediaQuery: mediaQuery, post: post),

            if ( post.comments != null && post.comments.isNotEmpty && post.comments.length >= 3 && limitComments )
            Container(
              margin: EdgeInsets.symmetric(vertical: mediaQuery.size.height * 0.02),
              padding: EdgeInsets.symmetric(
                horizontal: widthPadding
              ),
              child: GestureDetector(
                onTap: () => _checkPost(context),
                child: const Text(
                  'Ver mais',
                  style: TextStyle(fontSize: ThemeText.FONT_SIZE_SMALL, color: ThemeColors.BLUE_LIGHT_1),
                ),
              ),
            ),

            if( post.comments != null && post.comments.isNotEmpty && !limitComments )
            Container(
              margin: EdgeInsets.symmetric(vertical: mediaQuery.size.height * 0.02),
              padding: EdgeInsets.symmetric(
                horizontal: widthPadding
              ),
            ),

            if ( post.comments != null && post.comments.isNotEmpty )
            FeedListPostComments(postComments: post.comments.take( limitComments ? 3 : post.comments.length ).toList()),

            const FeedNewPostCommentInput(),

            if(limitComments)
            Container(color: ThemeColors.GREY_LIGHT_3, width: mediaQuery.size.width, height: mediaQuery.size.height * 0.01,)
          ],
        ),
      ),
    );
  }
}