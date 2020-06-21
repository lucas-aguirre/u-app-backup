import 'package:flutter/material.dart';
import 'package:ummense_app/src/models/user_model.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    this.user,
    this.radius = 20
  });

  final UserModel user;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.transparent,
        backgroundImage: user != null && user.avatar != null && user.avatar.isNotEmpty
        ? NetworkImage(user.avatar)
        : const AssetImage('assets/images/temp/UserAvatar.png'),
      ),
    );
  }
}

/**
 * A proposta é muito boa e o produto é super interessante! Mas, no momento eu aceitei uma proposta com início no dia 14, então terei que recusar.
 * Porém, desejo muito sucesso no desenvolvimento da ferramenta, parecer ser muito promissora!
 */