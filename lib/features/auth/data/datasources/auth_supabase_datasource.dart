import 'package:assignment_1/translation/translation.dart';

import '../../../../core/services/supabase_service.dart';
import '../../domain/models/user_model.dart';
import '../repos/auth_repo.dart';

class AuthSupabaseDatasource extends AuthRepo {
  final _client = SupabaseService.client;
  final String _table = 'users';

  @override
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _client
          .from(_table)
          .select()
          .eq('email', email)
          .single();
      return UserModel.fromJson(response);
    } catch (e) {
      //throw Exception(e.toString());
      throw Exception("User not found".i18n);
    }
  }

  @override
  Future<UserModel> register(
    String fullName,
    String email,
    String password,
  ) async {
    try {
      final response = await _client
          .from(_table)
          .insert({'full_name': fullName, 'email': email, 'password': password})
          .select()
          .single();

      return UserModel.fromJson(response);
    } catch (e) {
      //throw Exception(e.toString());
      throw Exception("Failed to register user".i18n);
    }
  }
}
