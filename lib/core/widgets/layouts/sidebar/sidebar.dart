import 'package:assignment_1/core/widgets/layouts/sidebar/menu_item.dart';
import 'package:assignment_1/translation/translation.dart';
import 'package:flutter/material.dart';

import '../../../../config/scales/gap.dart';
import '../../../../config/scales/sizes_config.dart';
import 'side_bar_title.dart';

class CustomSidebar extends StatefulWidget {
  const CustomSidebar({
    super.key,
    required this.currentPageIndex,
    required this.onItemSelected,
  });

  final int currentPageIndex;
  final Function(int) onItemSelected;

  @override
  State<CustomSidebar> createState() => _CustomSidebarState();
}

class _CustomSidebarState extends State<CustomSidebar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BorderDirectional(
        end: BorderSide(color: Theme.of(context).disabledColor, width: 1),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // LOGO & HERO TEXT
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: SizesConfig.md,
                horizontal: SizesConfig.md,
              ),
              child: Row(children: [
                  
                ],
              ),
            ),
            Gap.h16,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: SizesConfig.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // MENO
                  SideBarTitle(title: "Menu".i18n),
                  Gap.h8,
                  MenuItem(
                    icon: Icons.group,
                    itemName: "Agents".i18n,
                    pageNum: 0,
                    currentPage: widget.currentPageIndex,
                    onTap: widget.onItemSelected,
                  ),
                  Gap.h16,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
