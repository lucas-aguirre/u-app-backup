import 'package:flutter/material.dart';
import 'package:ummense_app/src/models/post_model.dart';
import 'package:ummense_app/src/widgets/ui/post_list_item.dart';

class NewPostAvailablePost extends StatelessWidget {
  const NewPostAvailablePost({this.post, this.selectCurrentPost, this.mediaQuery});

  final PostModel post;
  final Function selectCurrentPost;
  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectCurrentPost(post),
      child: Container(
        padding: EdgeInsets.only(right: mediaQuery.size.width * 0.1),
        child: PostItemList(post: post),
      ),
    );
  }
}