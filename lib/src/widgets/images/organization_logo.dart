import 'package:flutter/material.dart';

class OrganizationLogo extends StatelessWidget {
  const OrganizationLogo();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const CircleAvatar(
        backgroundImage: AssetImage('assets/images/organization/logo.png'),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}