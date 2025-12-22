import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/scales/gap.dart';
import '../../../../core/widgets/animation/failure_status_animation.dart';
import '../../../../core/widgets/data-table/custom/transaction/loading_transaction_table.dart';
import '../../../../core/widgets/data-table/custom/transaction/transaction_table.dart';
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
