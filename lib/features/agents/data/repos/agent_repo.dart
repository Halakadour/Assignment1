import '../../domain/models/agent_model.dart';

abstract class AgentRepo {
  Future<List<AgentModel>> getAgentsList(String userId);
  Stream<List<AgentModel>> getAgentsStream(String userId);
  Future<AgentModel> addAgent(AgentModel agent);
  Future<void> updateAgent(AgentModel agent);
  Future<void> deleteAgent(String agentId);
}
