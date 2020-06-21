import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ummense_app/src/api/api.dart';
import 'package:ummense_app/src/interfaces/user_repository_interface.dart';
import 'package:ummense_app/src/models/user_model.dart';

class UserRepository implements UserRepositoryInterface {

  @override
  Future<bool> requestValidationCode(String email) async {
    final Uri uri = Uri.parse(API.requestValidationCodeRoute);
    final Map<String, String> _email = {'email': email};

    await SharedPreferences.getInstance().then((SharedPreferences preferences) => <dynamic>{
      preferences.setString('login_email', email)
    });

    final Uri requestValidationCodeURI = uri.replace(queryParameters: _email);
    final http.Response response = await http.post(requestValidationCodeURI, headers: API.apiHeaders);

    if (response.statusCode != 200) {
      return Future<bool>.error(response.body, StackTrace.fromString(response.body));
    }

    return true;
  }

  @override
  Future<UserModel> login(int userCode) async {
    final String userEmail = await SharedPreferences.getInstance().then((SharedPreferences preferences){
      return preferences.get('login_email');
    });

    final Uri uri = Uri.parse(API.loginRoute);
    final Map<String, String> _params = {'code': userCode.toString(), 'email': userEmail};

    final Uri loginURI = uri.replace(queryParameters: _params);
    final http.Response response = await http.get(loginURI, headers: API.apiHeaders);

    if (response.statusCode != 200) {
      return Future<UserModel>.error(response.body, StackTrace.fromString(response.body));
    }

    print(response.body);

    final UserModel user = UserModel.fromJson(json.decode(response.body));

    await SharedPreferences.getInstance().then((SharedPreferences preferences) => <dynamic>{
      preferences.setString('user', json.encode(user))
    });

    return user;
  }

  @override
  Future<void> logout() async {
    return await SharedPreferences.getInstance().then((SharedPreferences preferences) => <void>{
      preferences.remove('user')
    });
  }

  @override
  Future<UserModel> register(String name, String lastname, String email) async  {
    final Uri uri = Uri.parse(API.registerRoute);
    final Map<String, String> _email = {'email': email, 'lastname': lastname, 'name': name};

    final Uri registerURI = uri.replace(queryParameters: _email);

    final http.Response response = await http.post(registerURI, headers: API.apiHeaders);

    if (response.statusCode != 200) {
      return Future<UserModel>.error(response.body, StackTrace.fromString(response.body));
    }

    final UserModel user = UserModel.fromJson(json.decode(response.body));

    await SharedPreferences.getInstance().then((SharedPreferences preferences) => <dynamic>{
      preferences.setString('login_email', email)
    });

    return user;
  }

  @override
  Future<UserModel> updateUser(UserModel user) {
    // TODO: implement updateUser
    return null;
  }

  @override
  Future<UserModel> getUserFromStorage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return UserModel.fromJson(json.decode(prefs.getString('user')));
  }
}