import 'package:flutter/material.dart';
import 'package:ummense_app/src/repositories/user_repository.dart';
import 'package:ummense_app/src/resources/login/login_button.dart';
import 'package:ummense_app/src/resources/login/login_code_error.dart';
import 'package:ummense_app/src/resources/login/login_code_input.dart';
import 'package:ummense_app/src/resources/login/login_screen_info.dart';
import 'package:ummense_app/src/routes/route_list.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/widgets/images/organization_logo.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _canSubmitData = false;
  bool _showRequestLoading = false;
  bool _showInvalidCodeMessage = false;
  String _invalidCodeMessage;
  String _email;

  void updateEmailValue(String email) {
    setState(() {
      _email = email;

      if ( email != null ) {
        _canSubmitData = true;
      } else {
        _canSubmitData = false;
      }
    });
  }

  void _requestValidationCode() {
    if ( !_showRequestLoading ) {
      setState(() {
        _invalidCodeMessage = '';
        _showInvalidCodeMessage = false;
        _showRequestLoading = true;
        _canSubmitData = false;
      });

      UserRepository().requestValidationCode(_email)
      .then((_) {
        return Navigator.pushNamed(context, RouteList.loginCodeValidation);
      })
      .catchError((dynamic error) => <void>{
        setState(() {
          _invalidCodeMessage = error.toString();
          _showInvalidCodeMessage = true;
          _showRequestLoading = false;
          _canSubmitData = true;
        })
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        body: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          return Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: constraints.maxWidth * 0.05,
                  right: constraints.maxWidth * 0.05,
                  top: constraints.maxHeight * 0.15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(child: const OrganizationLogo()),
                    SizedBox(height: constraints.maxHeight * 0.04),
                    LoginScreenInfo(sizedBoxHeight: constraints.maxHeight * 0.01),
                    SizedBox(height: constraints.maxHeight * 0.05),
                    LoginCodeInput(updateEmailValue: updateEmailValue),
                    SizedBox(height: constraints.maxHeight * 0.03),
                    LoginButton(canSubmitData: _canSubmitData, makeLogin: _requestValidationCode),
                    SizedBox(height: constraints.maxHeight * 0.03),
                    if ( _showRequestLoading )
                    SpinKitThreeBounce(
                      color: ThemeColors.GREY_LIGHT_1,
                      size: 30.0,
                    ),
                    if( _showInvalidCodeMessage )
                    LoginInvalidCodeMessage(message: _invalidCodeMessage)
                  ],
                ),
              )
            ],
          );
        }),
      )
    );
  }
}