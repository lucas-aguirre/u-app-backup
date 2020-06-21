
import 'package:flutter/material.dart';

class InputCheckbox extends StatefulWidget {
  const InputCheckbox();

  @override
  _InputCheckboxState createState() => _InputCheckboxState();
}

class _InputCheckboxState extends State<InputCheckbox> {
  final List<String> _checkboxes = <String>['Checkbox 1','Checkbox 2','Checkbox 3','Checkbox 4'];
  final List<bool> _checkboxesValues = <bool>[false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List<Widget>.generate(_checkboxes.length, (int index) {
        return CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(_checkboxes[index]),
          value: _checkboxesValues[index],
          onChanged: (bool newValue) {
            setState(() {
              _checkboxesValues[index] = newValue;
            });
          },
        );
      })
    );
  }
}