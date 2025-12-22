import 'package:assignment_1/translation/translation.dart';
import 'package:flutter/material.dart';

import '../../../../../config/scales/sizes_config.dart';
import '../../custom_paginated_data_table.dart';
import '../../loading/loading_rows.dart';

class LoadingTransactionTable extends StatelessWidget {
  const LoadingTransactionTable({super.key});

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
      source: LoadingRows(cellsCount: 7),
    );
  }
}
