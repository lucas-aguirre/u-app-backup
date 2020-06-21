import 'package:flutter/material.dart';
import 'package:ummense_app/src/models/user_model.dart';
import 'package:ummense_app/src/repositories/user_repository.dart';
import 'package:ummense_app/src/resources/profile/profile_app_bar.dart';
import 'package:ummense_app/src/resources/profile/profile_header_info.dart';
import 'package:ummense_app/src/resources/profile/profile_list_info.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen();

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel user;

  Future<UserModel> fetchUser() async {
    final UserModel user = await UserRepository().getUserFromStorage();
    return user;
  }

  @override
  Widget build(BuildContext context) {
    fetchUser().then((UserModel currentUser) {
      setState(() {
        user = currentUser;
      });
    });

    return Scaffold(
      appBar: const ProfileAppBar(),
      body: ListView(
        children: <Widget>[
          ProfileHeaderInfo(user: user),
          const Divider(color: ThemeColors.GREY_LIGHT_2),
          if(user != null && user.cellphone != null)
          ProfileListInfo(infoName: 'Celular', infoValue: user.cellphone),
          if(user != null && user.email != null)
          ProfileListInfo(infoName: 'E-mail', infoValue: user.email),
        ],
      )
    );
  }
}