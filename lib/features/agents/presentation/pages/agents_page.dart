import 'package:assignment_1/core/widgets/animation/loading_status_animation.dart';
import 'package:assignment_1/core/widgets/buttons/icon-buttons/out_line_icon_button.dart';
import 'package:assignment_1/features/agents/presentation/providers/agent_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/scales/gap.dart';
import '../../../../core/widgets/animation/empty_status_animation.dart';
import '../../../../core/widgets/animation/failure_status_animation.dart';
import '../widgets/agent_card.dart';

class AgentsPage extends ConsumerWidget {
  const AgentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agentAsync = ref.watch(agentsProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // 🔍 Search + Filter
            Gap.h24,
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'Search by name',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      // ref.read(agentAsync.notifier).state = value;
                    },
                  ),
                ),
                Gap.w16,
                OutLineIconButton(
                  onPressed: () {},
                  icon: Icon(Icons.filter_alt_rounded),
                ),
              ],
            ),

            Gap.h24,

            // 📋 Cards
            Expanded(
              child: agentAsync.when(
                data: (agents) {
                  return ListView.builder(
                    itemCount: agents.length,
                    itemBuilder: (context, index) {
                      if (agents.isEmpty) {
                        return const EmptyStatusAnimation();
                      } else {
                        return AgentCard(agent: agents[index]);
                      }
                    },
                  );
                },
                loading: () => const LoadingStatusAnimation(),
                error: (e, _) =>
                    FailureStatusAnimation(errorMessage: e.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
