import 'package:flutter/material.dart';

class SettingModel {
  const SettingModel({
    @required this.songsNotification,
    @required this.vibrateNotification,
    @required this.pushNotification,
  });

  final bool songsNotification;
  final bool vibrateNotification;
  final bool pushNotification;
}