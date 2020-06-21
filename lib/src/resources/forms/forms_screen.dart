import 'package:flutter/material.dart';
import 'package:ummense_app/src/widgets/inputs/input_checkbox.dart';
import 'package:ummense_app/src/widgets/inputs/input_radio_button.dart';
import 'package:ummense_app/src/widgets/inputs/input_select_box.dart';
import 'package:ummense_app/src/widgets/inputs/input_text.dart';
import 'package:ummense_app/src/widgets/inputs/input_text_area.dart';
import 'package:ummense_app/src/widgets/inputs/input_upload.dart';

class FormsScreen extends StatelessWidget {
  const FormsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 50),
          const Center(child: InputCheckbox()),
          const SizedBox(height: 50),
          const Center(child: InputRadioButton()),
          const SizedBox(height: 50),
          const Center(child: InputSelectBox()),
          const SizedBox(height: 50),
          const Center(child: InputTextArea()),
          const SizedBox(height: 50),
          const Center(child: InputText()),
          const SizedBox(height: 50),
          const Center(child: InputUpload()),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
