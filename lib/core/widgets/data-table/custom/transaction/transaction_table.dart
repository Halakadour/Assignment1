import 'package:flutter/material.dart';
import 'package:i18n_extension/default.i18n.dart';

import '../../../../../config/scales/sizes_config.dart';
import '../../../../../features/agents/domain/models/transaction_model.dart';
import '../../custom_paginated_data_table.dart';
import 'transaction_table_source.dart';

class TransactionTable extends StatelessWidget {
  const TransactionTable({super.key, required this.transactionList});
  final List<TransactionModel?> transactionList;

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(
      minWidth: 700,
      tableHeight: 500,
      dataRowHeight: SizesConfig.xl * 2.2,
      columns: [
        DataColumn(label: Text('Number'.i18n)),
        DataColumn(label: Text('Amount'.i18n)),
        DataColumn(label: Text('Currency'.i18n)),
        DataColumn(label: Text('Type'.i18n)),
        DataColumn(label: Text('Details'.i18n)),
        DataColumn(label: Text('Date'.i18n)),
        DataColumn(label: Text('Actions'.i18n)),
      ],
      source: TransactionTableSource(
        transactionList: transactionList,
        context: context,
      ),
    );
  }
}
