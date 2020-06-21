import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ummense_app/src/resources/feed/feed_loading_posts_item.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';

class FeedLoadingPosts extends StatefulWidget {
  const FeedLoadingPosts({this.widthPadding});
  final double widthPadding;

  @override
  _FeedLoadingPostsState createState() => _FeedLoadingPostsState();
}

class _FeedLoadingPostsState extends State<FeedLoadingPosts> {

  @override
  Widget build(BuildContext context) {
    final MediaQueryData _mediaQuery = MediaQuery.of(context);

    final Widget _loadingPostTitle = Shimmer.fromColors(
      baseColor: ThemeColors.GREY_LIGHT_3,
      highlightColor: ThemeColors.GREY_LIGHT_2,
      child: Row(
        children: <Widget>[
          const CircleAvatar(radius: 20),
          Container(color: ThemeColors.TRANSPARENT, height: 20, width: 20),
          Container(color: ThemeColors.GREY_LIGHT_3, height: 15, width: 150)
        ],
      ),
    );

    return Padding(
      padding: EdgeInsets.all(_mediaQuery.size.width * 0.05),
      child: ListView(
        children: <Widget>[
          _loadingPostTitle,
          FeedLoadingPostsItem(mediaQuery: _mediaQuery),
          FeedLoadingPostsItem(mediaQuery: _mediaQuery),
          FeedLoadingPostsItem(mediaQuery: _mediaQuery),
          FeedLoadingPostsItem(mediaQuery: _mediaQuery),
        ],
      ),
    );
  }
}