import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';

class FeedLoadingPostsItem extends StatelessWidget {
  const FeedLoadingPostsItem({this.mediaQuery});

  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    final Widget _loadingItemDescriptionLine = Padding(
      padding: EdgeInsets.only(top: mediaQuery.size.height * 0.01),
      child: Column(
        children: <Widget>[
          Container(color: ThemeColors.GREY_LIGHT_3, height: 12, width: mediaQuery.size.width),
        ],
      ),
    );

    final Widget _loadingItemInput = Row(
      children: <Widget>[
        const CircleAvatar(radius: 20),
        Container(color: ThemeColors.TRANSPARENT, height: 20, width: 20),
        Column(
          children: <Widget>[
            Container(color: ThemeColors.GREY_LIGHT_3, height: 12, width: 150),
            Padding(
              padding: EdgeInsets.only(top: mediaQuery.size.height * 0.01),
              child: Container(color: ThemeColors.GREY_LIGHT_3, height: 6, width: 150),
            ),
          ],
        )
      ],
    );

    return Padding(
      padding: EdgeInsets.only(top: mediaQuery.size.height * 0.05),
      child: Shimmer.fromColors(
        baseColor: ThemeColors.GREY_LIGHT_3,
        highlightColor: ThemeColors.GREY_LIGHT_2,
        child: Column(
          children: <Widget>[
            _loadingItemInput,
            Padding(padding: EdgeInsets.only(top: mediaQuery.size.height * 0.02)),
            _loadingItemDescriptionLine,
            _loadingItemDescriptionLine,
            _loadingItemDescriptionLine,
            _loadingItemDescriptionLine,
            _loadingItemDescriptionLine,
          ],
        ),
      ),
    );
  }
}