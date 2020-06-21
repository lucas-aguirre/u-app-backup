import 'package:flutter/material.dart';
import 'package:ummense_app/src/models/post_model.dart';
import 'package:ummense_app/src/resources/post_info/post_info_app_bar.dart';
import 'package:ummense_app/src/widgets/ui/post_info.dart';

class PostInfoScreen extends StatelessWidget {
  const PostInfoScreen({
    this.post,
  });
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double widthPadding = mediaQuery.size.width * 0.045;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: PostInfoAppBar(title: post.project != null && post.project.name != null ? post.project.name : 'Post'),
          body: PostInfo(post: post, mediaQuery: mediaQuery, widthPadding: widthPadding, limitComments: false),
        );
      },
    );
  }
}
