import 'package:flutter/material.dart';
import 'package:ummense_app/src/repositories/user_repository.dart';
import 'package:ummense_app/src/resources/register/register_button.dart';
import 'package:ummense_app/src/resources/register/register_code_error.dart';
import 'package:ummense_app/src/resources/register/register_code_input.dart';
import 'package:ummense_app/src/resources/register/register_screen_info.dart';
import 'package:ummense_app/src/routes/route_list.dart';
import 'package:ummense_app/src/theme/theme_colors.dart';
import 'package:ummense_app/src/widgets/images/organization_logo.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen();
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _canSubmitData = false;
  bool _showRequestLoading = false;
  bool _showInvalidRequestMessage = false;
  String _invalidCodeMessage;
  String _email;
  String _name;
  String _lastname;

  void updateNameValue(String name) {
    setState(() {
      _name = name;
      checkIfCanSubmitData();
    });
  }

  void updateLastnameValue(String lastname) {
    setState(() {
      _lastname = lastname;
      checkIfCanSubmitData();
    });
  }

  void updateEmailValue(String email) {
    setState(() {
      _email = email;
      checkIfCanSubmitData();
    });
  }

  void checkIfCanSubmitData() {
    setState(() {
      if ( _email != null && _name != null ) {
        _canSubmitData = true;
      } else {
        _canSubmitData = false;
      }
    });
  }

  void _registerContact() {
    if ( !_showRequestLoading ) {
      setState(() {
        _invalidCodeMessage = '';
        _showInvalidRequestMessage = false;
        _showRequestLoading = true;
        _canSubmitData = false;
      });

      UserRepository().register(_name, _lastname, _email)
      .then((_) {
        return Navigator.pushNamed(context, RouteList.loginCodeValidation);
      })
      .catchError((dynamic error) => <void>{
        setState(() {
          _invalidCodeMessage = error.toString();
          _showInvalidRequestMessage = true;
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
          return SingleChildScrollView(
            child: Flex(
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
                      RegisterScreenInfo(sizedBoxHeight: constraints.maxHeight * 0.01),
                      SizedBox(height: constraints.maxHeight * 0.05),
                      RegisterCodeInput(updateInputValue: updateNameValue, labelText: 'Seu nome'),
                      SizedBox(height: constraints.maxHeight * 0.02),
                      RegisterCodeInput(updateInputValue: updateLastnameValue, labelText: 'Seu sobrenome',),
                      SizedBox(height: constraints.maxHeight * 0.02),
                      RegisterCodeInput(updateInputValue: updateEmailValue, labelText: 'Seu e-mail',),
                      SizedBox(height: constraints.maxHeight * 0.03),
                      RegisterButton(canSubmitData: _canSubmitData, makeLogin: _registerContact),
                      SizedBox(height: constraints.maxHeight * 0.03),
                      if ( _showRequestLoading )
                      SpinKitThreeBounce(
                        color: ThemeColors.GREY_LIGHT_1,
                        size: 30.0,
                      ),
                      if( _showInvalidRequestMessage )
                      RegisterInvalidCodeMessage(message: _invalidCodeMessage)
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      )
    );
  }
}