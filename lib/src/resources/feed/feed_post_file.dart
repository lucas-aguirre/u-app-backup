import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ummense_app/src/models/post_model.dart';
import 'package:ummense_app/src/widgets/images/fullscreen_image.dart';

class FeedPostFile extends StatelessWidget {
  const FeedPostFile({this.mediaQuery, this.post, this.isComment = false});

  final MediaQueryData mediaQuery;
  final PostModel post;
  final bool isComment;

  Future<void> downloadFile(PostModel post, String filename) async {
    if (await canLaunch(post.file.getFilePath)) {
      await launch(post.file.getFilePath);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (post != null && post.file != null && post.file.path.isNotEmpty && post.file.getFileType == 'image') {
          Navigator.push(
            context,
            MaterialPageRoute<dynamic>(
              builder: (dynamic context) =>
                  FullScreenImage(imageUrl: post.file.getFilePath),
            ),
          )
        }
        else {
          downloadFile(post, 'file.' + post.file.type)
        }
      },
      child: Container(
        padding: EdgeInsets.only(
          top: mediaQuery.size.height * 0.015,
        ),
        constraints: BoxConstraints(
          maxHeight: isComment || post.file.getFileType != 'image'
              ? mediaQuery.size.height * 0.2
              : mediaQuery.size.height * 0.5,
        ),
        width: mediaQuery.size.width,
        child: post != null && post.file != null && post.file.path.isNotEmpty
        ? post.file.getFileThumbnail
        : const Text('teste')
      ),
    );
  }
}
