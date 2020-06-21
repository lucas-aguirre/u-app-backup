import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ummense_app/src/models/user_model.dart';
import 'package:ummense_app/src/theme/theme_text.dart';
import 'package:ummense_app/src/widgets/images/user_avatar.dart';

class ProfileHeaderInfo extends StatelessWidget {
  const ProfileHeaderInfo({this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Container(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.03
          ),
          child: const UserAvatar(
            radius: 60,
          ),
        )),
        Center(
          child: Text(
            user.name,
            style: TextStyle(fontSize: ThemeText.FONT_SIZE_LARGE),
          )
        ),
      ],
    );
  }
}
