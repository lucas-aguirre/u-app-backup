import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ummense_app/src/resources/new_post/new_post_navbar_icon.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';

class NewPostNavbarListIcons extends StatelessWidget {
  const NewPostNavbarListIcons({this.mediaQuery});

  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        NewPostNavbarIcon(mediaQuery: mediaQuery, onTap: () async { await ImagePicker.pickImage(source: ImageSource.camera); }, icon: Icon(Icons.camera_alt,color: ThemeColors.GREY_LIGHT_1,)),
        NewPostNavbarIcon(mediaQuery: mediaQuery, onTap: () async { await ImagePicker.pickImage(source: ImageSource.gallery); }, icon: Icon(Icons.insert_photo,color: ThemeColors.GREY_LIGHT_1,)),
        NewPostNavbarIcon(mediaQuery: mediaQuery, onTap: () {}, icon: Icon(Icons.attach_file,color: ThemeColors.GREY_LIGHT_1,)),
        NewPostNavbarIcon(mediaQuery: mediaQuery, onTap: () {}, icon: Icon(Icons.keyboard,color: ThemeColors.GREY_LIGHT_1,)),
      ],
    );
  }
}