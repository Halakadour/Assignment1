import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../../config/scales/sizes_config.dart';
import '../../shimmers/shimmer_table_item.dart';

class LoadingRows extends DataTableSource {
  LoadingRows({required this.cellsCount});
  int cellsCount;
  @override
  DataRow? getRow(int index) {
    return DataRow2(
      onTap: () {},
      selected: false,
      onSelectChanged: (value) {},
      cells: List.generate(cellsCount, (index) => DataCell(ShimmerTableItem())),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => SizesConfig.loadingRowsCounts;

  @override
  int get selectedRowCount => 0;
}
