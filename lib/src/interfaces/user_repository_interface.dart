import 'package:ummense_app/src/models/setting_model.dart';
import 'package:ummense_app/src/models/user_model.dart';

abstract class UserRepositoryInterface {
  Future<UserModel> register(String name, String lastname, String email);
  Future<UserModel> login(int code);
  Future<bool> requestValidationCode(String email );
  Future<void> logout();
  Future<UserModel> updateUser(UserModel user);
  Future<UserModel> getUserFromStorage();
}