import 'package:flutter/material.dart';

class OrganizationUserModel {
  const OrganizationUserModel({
    @required this.id,
    @required this.name,
    @required this.lastname,
    @required this.email,
    @required this.phone,
    @required this.profile,
    @required this.avatar,
  });
  
  final int id;
  final String name;
  final String lastname;
  final String email;
  final String phone;
  final String profile;
  final String avatar;

  String get fullname => name + lastname;

  String get userAvatar => 'teste';
}