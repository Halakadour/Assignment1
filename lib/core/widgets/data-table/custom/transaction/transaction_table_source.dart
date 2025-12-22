import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../features/agents/domain/models/transaction_model.dart';
import '../../../../../features/agents/presentation/providers/transaction_providers.dart';

class TransactionTableSource extends DataTableSource {
  final List<TransactionModel?> transactionList;
  BuildContext context;

  TransactionTableSource({
    required this.transactionList,
    required this.context,
  });
  @override
  DataRow? getRow(int index) {
    final transaction = transactionList[index];
    return DataRow2(
      onTap: () {},
      selected: false,
      onSelectChanged: (value) {},
      cells: [
        DataCell(Text(transaction!.id)),
        DataCell(Text(transaction.amount.toStringAsFixed(2))),
        DataCell(Text(transaction.currency)),
        DataCell(Text(transaction.type.name)),
        DataCell(Text(transaction.details ?? "")),
        DataCell(Text(transaction.createdAt.timeZoneName)),
        DataCell(
          Consumer(
            builder: (context, ref, child) => IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                await ref
                    .read(transactionsProvider(transaction.agentId).notifier)
                    .deleteTransaction(transaction.id);
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => transactionList.length;

  @override
  int get selectedRowCount => 0;
}
