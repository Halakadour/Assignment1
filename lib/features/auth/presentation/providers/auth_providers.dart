import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/datasources/auth_supabase_datasource.dart';
import '../../data/repos/auth_repo.dart';
import '../../domain/models/user_model.dart';

final authRepositoryProvider = Provider<AuthRepo>((ref) {
  return AuthSupabaseDatasource();
});

final authProvider = AsyncNotifierProvider<AuthNotifier, UserModel?>(
  AuthNotifier.new,
);

class AuthNotifier extends AsyncNotifier<UserModel?> {
  late final AuthRepo _repo;

  @override
  Future<UserModel?> build() async {
    // get the repo form the its provider
    _repo = ref.read(authRepositoryProvider);
    // at first there is no user yet
    return null;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return await _repo.login(email, password);
    });
  }

  Future<void> register(String fullName, String email, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      return await _repo.register(fullName, email, password);
    });
  }

  void logout() {
    state = const AsyncData(null);
  }
}
