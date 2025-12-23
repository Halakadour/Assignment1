import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/providers/auth_providers.dart';
import '../../application/services/storage_service.dart';
import '../../data/datasources/agent_supabase_datasource.dart';
import '../../data/repos/agent_repo.dart';
import '../../domain/models/agent_model.dart';

// Provider for repo
final agentsRepositoryProvider = Provider<AgentRepo>((ref) {
  return AgentSupabaseDatasource();
});
// Provider for agents
final agentsProvider = AsyncNotifierProvider<AgentsNotifier, List<AgentModel>>(
  AgentsNotifier.new,
);

// The agent notifier
class AgentsNotifier extends AsyncNotifier<List<AgentModel>> {
  late final AgentRepo _repo;

  @override
  Future<List<AgentModel>> build() async {
    _repo = ref.read(agentsRepositoryProvider);

    final user = ref.read(authProvider).value;
    if (user == null) return [];

    return _repo.getAgentsList(user.id);
  }

  Future<void> addAgent({required String name, String? imageUrl}) async {
    final user = ref.read(authProvider).value;
    if (user == null) return;

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      final newAgent = await _repo.addAgent(
        AgentModel(
          id: '',
          userId: user.id,
          name: name,
          imageUrl: imageUrl,
          createdAt: DateTime.now(),
        ),
      );

      final current = state.value ?? [];
      return [...current, newAgent];
    });
  }

  Future<void> deleteAgent(String agentId) async {
    final current = state.value ?? [];

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await _repo.deleteAgent(agentId);
      return current.where((a) => a.id != agentId).toList();
    });
  }

  Future<void> addAgentWithImage({
    required String name,
    Uint8List? imageBytes,
  }) async {
    final user = ref.read(authProvider).value;
    if (user == null) return;

    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      String? imageUrl;

      if (imageBytes != null) {
        final storage = StorageService();
        imageUrl = await storage.uploadAgentImage(
          bytes: imageBytes,
          fileName: 'agent.png',
        );
      }

      final newAgent = await _repo.addAgent(
        AgentModel(
          id: '',
          userId: user.id,
          name: name,
          imageUrl: imageUrl,
          createdAt: DateTime.now(),
        ),
      );

      final current = state.value ?? [];
      return [...current, newAgent];
    });
  }
}
