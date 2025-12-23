import 'package:assignment_1/translation/translation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/scales/gap.dart';
import '../../../../core/widgets/animation/failure_status_animation.dart';
import '../../../../core/widgets/data-table/custom/transaction/loading_transaction_table.dart';
import '../../../../core/widgets/data-table/custom/transaction/transaction_table.dart';
import '../../../../core/widgets/dialog/agent/add_transaction_dialog.dart';
import '../providers/transaction_providers.dart';

class TransactionPage extends ConsumerWidget {
  const TransactionPage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(transactionsProvider(id));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Gap.h24,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => AddTransactionDialog(agentId: id),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      Gap.w8,
                      Text("Add Transaction".i18n),
                    ],
                  ),
                ),
              ],
            ),
            Gap.h24,
            // 📋 Table
            Expanded(
              child: transactionsAsync.when(
                data: (transaction) {
                  return TransactionTable(transactionList: transaction);
                },
                loading: () => const LoadingTransactionTable(),
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
