import 'package:flutter/material.dart';

class IndexLogo extends StatelessWidget {
  const IndexLogo({this.screenHeight});

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.4,
      child: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Container(
              child: CircleAvatar(
                backgroundImage: const ExactAssetImage('assets/images/organization/logo.png'),
                backgroundColor: Colors.transparent,
                minRadius: constraints.maxHeight - ( constraints.maxHeight * 0.5),
                maxRadius: constraints.maxHeight - ( constraints.maxHeight * 0.5),
              ),
            );
          },
        ),
      ),
    );
  }
}