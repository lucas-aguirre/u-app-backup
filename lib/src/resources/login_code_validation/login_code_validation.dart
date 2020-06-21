import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ummense_app/src/models/user_model.dart';
import 'package:ummense_app/src/repositories/user_repository.dart';
import 'package:ummense_app/src/resources/login/login_code_error.dart';
import 'package:ummense_app/src/routes/route_list.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/theme/theme_text.dart';
import 'package:ummense_app/src/widgets/buttons/action_button.dart';

class LoginCodeValidation extends StatefulWidget {
  const LoginCodeValidation();
  @override
  _LoginCodeValidationState createState() => _LoginCodeValidationState();
}

class _LoginCodeValidationState extends State<LoginCodeValidation> {

  final InputDecoration _inputDecoration = InputDecoration(
    filled: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 30.0),
    fillColor: ThemeColors.GREY_LIGHT_3,
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: ThemeColors.GREY_DARK),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: ThemeColors.GREY_DARK),
      borderRadius: BorderRadius.circular(10),
    ),
  );

  int loginCode = null;
  bool _showRequestLoading = false;
  bool _showInvalidCodeMessage = false;
  String _invalidCodeMessage;

  final FocusNode _secondInputFocus = FocusNode();
  final FocusNode _thirdInputFocus = FocusNode();
  final FocusNode _fourthInputFocus = FocusNode();

  final TextEditingController _firstCodeController = TextEditingController();
  final TextEditingController _secondCodeController = TextEditingController();
  final TextEditingController _thirdCodeController = TextEditingController();
  final TextEditingController _fourthCodeController = TextEditingController();

  bool canSubmitData = false;

  void _checkIfCanSubmitData(TextEditingController firstCode, TextEditingController secondCode, TextEditingController thirdCode, TextEditingController fourthCode){
    if ( firstCode.text.isNotEmpty && secondCode.text.isNotEmpty && thirdCode.text.isNotEmpty && fourthCode.text.isNotEmpty) {
      setState(() {
       canSubmitData = true;
       loginCode = int.parse(firstCode.value.text + secondCode.text + thirdCode.text + fourthCode.text);
      });
    } else {
      if ( canSubmitData ) {
        setState(() {
          loginCode = null;
          canSubmitData = false;
        });
      }
    }
  }

  void login() {
    setState(() {
      _showRequestLoading = true;
      canSubmitData = false;
    });

    UserRepository().login(loginCode)
    .then((UserModel user){
      return Navigator.popAndPushNamed(context, RouteList.homeRoute);
    }).catchError((error){
      setState(() {
        _invalidCodeMessage = error.toString();
        canSubmitData = true;
       _showRequestLoading = false;
       _showInvalidCodeMessage = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: constraints.maxWidth * 0.05,
                right: constraints.maxWidth * 0.05,
                top: constraints.maxHeight * 0.15,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: constraints.maxHeight * 0.15,
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Digite o código',
                        style: TextStyle(
                            fontSize: ThemeText.FONT_SIZE_SMALL,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.GREY_BASE),
                      ),
                      Text(
                        'que enviamos para seu e-mail',
                        style: TextStyle(
                            fontSize: ThemeText.FONT_SIZE_SMALL,
                            color: ThemeColors.GREY_BASE),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: ThemeColors.GREY_DARK, fontSize: 40, fontWeight: FontWeight.bold),
                              keyboardType: TextInputType.phone,
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(1),
                              ],
                              controller: _firstCodeController,
                              onChanged: (_) => _checkIfCanSubmitData(_firstCodeController, _secondCodeController, _thirdCodeController, _fourthCodeController),
                              onSubmitted: (_) => FocusScope.of(context).requestFocus(_secondInputFocus),
                              decoration: _inputDecoration,
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: constraints.maxWidth * 0.02),
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: ThemeColors.GREY_DARK, fontSize: 40, fontWeight: FontWeight.bold),
                              focusNode: _secondInputFocus,
                              keyboardType: TextInputType.phone,
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(1),
                              ],
                              controller: _secondCodeController,
                              onChanged: (_) => _checkIfCanSubmitData(_firstCodeController, _secondCodeController, _thirdCodeController, _fourthCodeController),
                              onSubmitted: (_) => FocusScope.of(context).requestFocus(_thirdInputFocus),
                              decoration: _inputDecoration,
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: constraints.maxWidth * 0.02),
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: ThemeColors.GREY_DARK, fontSize: 40, fontWeight: FontWeight.bold),
                              focusNode: _thirdInputFocus,
                              keyboardType: TextInputType.phone,
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(1),
                              ],
                              controller: _thirdCodeController,
                              onChanged: (_) => _checkIfCanSubmitData(_firstCodeController, _secondCodeController, _thirdCodeController, _fourthCodeController),
                              onSubmitted: (_) => FocusScope.of(context).requestFocus(_fourthInputFocus),
                              decoration: _inputDecoration,
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(width: constraints.maxWidth * 0.02),
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: ThemeColors.GREY_DARK, fontSize: 40, fontWeight: FontWeight.bold),
                              focusNode: _fourthInputFocus,
                              keyboardType: TextInputType.phone,
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(1),
                              ],
                              controller: _fourthCodeController,
                              onChanged: (_) => _checkIfCanSubmitData(_firstCodeController, _secondCodeController, _thirdCodeController, _fourthCodeController),
                              decoration: _inputDecoration,
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: constraints.maxHeight * 0.05),
                      Container(
                        child: ActionButton(
                          buttonText: const Text('Avançar'),
                          textColor: ThemeColors.GREY_LIGHT_4,
                          buttonFunction: canSubmitData
                          ? () => login()
                          : null,
                          buttonColor: canSubmitData ? ThemeColors.BLUE_BASE : ThemeColors.GREY_LIGHT_1,
                        ),
                      ),
                      if ( _showRequestLoading )
                      SpinKitThreeBounce(
                        color: ThemeColors.GREY_LIGHT_1,
                        size: 30.0,
                      ),
                      if( _showInvalidCodeMessage )
                      LoginInvalidCodeMessage(message: _invalidCodeMessage)
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
