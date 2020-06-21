import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  const FullScreenImage({this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onLongPress: () => print('longpress'),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.contain
          ) ,
        ),
      ),
    );
  }
}