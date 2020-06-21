import 'package:flutter/material.dart';
import 'package:ummense_app/src/models/post_model.dart';
import 'package:ummense_app/src/models/user_model.dart';

class Notification {
  const Notification({
    @required this.user,
    @required this.post
  });

  final UserModel user;
  final PostModel post;
}

// TODO(Lucas): frase genérica para caso postar somente uma imagem