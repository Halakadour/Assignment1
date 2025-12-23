import 'package:assignment_1/config/router/app_route_config.dart';
import 'package:assignment_1/config/scales/gap.dart';
import 'package:assignment_1/features/agents/domain/models/agent_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AgentCard extends StatelessWidget {
  const AgentCard({super.key, required this.agent});
  final AgentModel agent;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        hoverColor: Theme.of(context).hoverColor,
        onTap: () => context.pushNamed(
          AppRouteConfig.transactions,
          pathParameters: {'id': agent.id},
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: agent.imageUrl != null
                    ? NetworkImage(agent.imageUrl!)
                    : null,
                child: agent.imageUrl == null ? const Icon(Icons.person) : null,
              ),
              Gap.w16,
              Text(agent.name),
            ],
          ),
        ),
      ),
    );
    // ListTile(
    //   onTap: () => context.pushNamed(
    //     AppRouteConfig.transactions,
    //     pathParameters: {'id': agent.id},
    //   ),
    //   hoverColor: Theme.of(context).hoverColor,
    //   leading: CircleAvatar(
    //     radius: 24,
    //     backgroundImage: agent.imageUrl != null
    //         ? NetworkImage(agent.imageUrl!)
    //         : null,
    //     child: agent.imageUrl == null ? const Icon(Icons.person) : null,
    //   ),
    //   title: Text(agent.name),
    // );
  }
}
