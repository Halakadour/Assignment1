import 'package:assignment_1/features/agents/domain/models/agent_model.dart';
import 'package:flutter/material.dart';

class AgentCard extends StatelessWidget {
  const AgentCard({super.key, required this.agent});
  final AgentModel agent;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text(agent.name),
      subtitle: Text("\$10"),
    );
  }
}
