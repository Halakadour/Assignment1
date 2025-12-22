import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../../../config/scales/sizes_config.dart';
import '../animation/empty_status_animation.dart';

class CustomPaginatedDataTable extends StatelessWidget {
  const CustomPaginatedDataTable({
    super.key,
    required this.columns,
    required this.source,
    this.rowsPerPage = 10,
    this.tableHeight = SizesConfig.tableHeight,
    this.onPageChanges,
    this.onRowsPerPageChanged,
    this.sortColumnIndex,
    this.dataRowHeight = SizesConfig.xl * 2,
    this.sortAsending = true,
    this.minWidth = SizesConfig.tablMinWidth,
  });
  // whether to sort the DataTable in ascending or descending order;
  final bool sortAsending;

  // Index of the column to sort by
  final int? sortColumnIndex;

  //Number of rows to display pre page
  final int rowsPerPage;

  // Data source for the DataTable
  final DataTableSource source;

  //List of the columns for the DataTable
  final List<DataColumn> columns;

  // callback function to handle page changes
  final Function(int)? onPageChanges;

  // On Row selected
  final void Function(int?)? onRowsPerPageChanged;

  // Height of each data row in the DataTable
  final double dataRowHeight;

  // Height of the entrie DataTable
  final double tableHeight;

  // Minimum width of the entire DataTable
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tableHeight,
      child: Theme(
        data: Theme.of(context).copyWith(
          cardTheme: CardThemeData(
            color: Theme.of(context).cardColor,
            elevation: 0,
          ),
        ),
        child: PaginatedDataTable2(
          source: source,

          // COLUMNS & ROWS
          columns: columns,
          columnSpacing: 12,
          minWidth: minWidth,
          dividerThickness: 0,
          horizontalMargin: 12,
          rowsPerPage: rowsPerPage,
          dataRowHeight: dataRowHeight,

          // CHECKBOX
          showCheckboxColumn: false,

          // PAGINATION
          showFirstLastButtons: true,
          onPageChanged: onPageChanges,
          renderEmptyRowsInTheEnd: false,
          onRowsPerPageChanged: (noOfRows) {},

          // HEADER DESIGN
          headingTextStyle: Theme.of(context).textTheme.labelMedium,
          headingRowColor: WidgetStateColor.resolveWith(
            (states) => Theme.of(context).primaryColor,
          ),
          headingRowDecoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SizesConfig.borderRadiusMd),
              topRight: Radius.circular(SizesConfig.borderRadiusMd),
            ),
          ),
          empty: EmptyStatusAnimation(),

          // Data Style
          dataTextStyle: Theme.of(context).textTheme.labelSmall,

          // SORTING
          sortAscending: sortAsending,
          sortColumnIndex: sortColumnIndex,
          sortArrowBuilder: (ascending, sorted) {
            if (sorted) {
              return Icon(
                ascending ? Icons.arrow_upward : Icons.arrow_downward,
                size: SizesConfig.iconsSm,
              );
            } else {
              return const Icon(
                Icons.arrow_downward,
                size: SizesConfig.iconsSm,
              );
            }
          },
        ),
      ),
    );
  }
}
