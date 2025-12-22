import 'package:assignment_1/features/agents/domain/models/agent_model.dart';

import '../../../../core/services/supabase_service.dart';
import '../repos/agent_repo.dart';

class AgentSupabaseDatasource extends AgentRepo {
  final _client = SupabaseService.client;
  final String _table = 'agents';

  @override
  Future<AgentModel> addAgent(AgentModel agent) async {
    try {
      final response = await _client
          .from(_table)
          .insert({
            'user_id': agent.userId,
            'name': agent.name,
            'image_url': agent.imageUrl,
          })
          .select()
          .single();
      return AgentModel.fromJson(response);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> deleteAgent(String agentId) async {
    await _client.from(_table).delete().eq('id', agentId);
  }

  @override
  Future<List<AgentModel>> getAgentsList(String userId) async {
    try {
      final response = await _client
          .from(_table)
          .select()
          .eq('user_id', userId)
          .order('created_at', ascending: false);
      return response.map((data) => AgentModel.fromJson(data)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Stream<List<AgentModel>> getAgentsStream(String userId) {
    return _client
        .from(_table)
        .stream(primaryKey: ['id'])
        .eq('user_id', userId)
        .order('created_at', ascending: false)
        .map((data) => data.map((data) => AgentModel.fromJson(data)).toList());
  }

  @override
  Future<void> updateAgent(AgentModel agent) {
    // TODO: implement updateAgent
    throw UnimplementedError();
  }
}
