import 'package:flutter/material.dart';
import 'package:ummense_app/src/resources/update_profile/update_profile_app_bar.dart';
import 'package:ummense_app/src/resources/update_profile/update_profile_input.dart';
import 'package:ummense_app/src/widgets/images/user_avatar.dart';

class UpdateProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const UpdateProfileAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.045
          ),
          child: ListView(
            children: <Widget>[
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.03
                  ),
                  child: const UserAvatar(
                    radius: 60,
                  ),
                )
              ),
              const UpdateProfileInput(label: 'Nome'),
              const UpdateProfileInput(label: 'E-mail'),
              const UpdateProfileInput(label: 'Celular'),
            ],
          ),
        ));
  }
}
