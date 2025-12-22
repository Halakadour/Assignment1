import '../../domain/models/user_model.dart';

abstract class AuthRepo {
  Future<UserModel> login(String email, String password);
  Future<UserModel> register(String fullName, String email, String password);
  //Future<void> logout(String id);
  //Future<void> deleteAccount(String id);
}
