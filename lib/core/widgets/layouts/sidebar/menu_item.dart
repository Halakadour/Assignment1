import 'package:flutter/material.dart';

import '../../../../config/scales/sizes_config.dart';
import '../../../../config/theme/app_text_styles.dart';

// ignore: must_be_immutable
class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.icon,
    required this.itemName,
    required this.pageNum,
    required this.currentPage,
    required this.onTap,
  });

  final IconData icon;
  final String itemName;
  final int pageNum;
  final int currentPage;
  final Function(int) onTap; // Callback function

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(pageNum);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: SizesConfig.animationDuration),
        margin: const EdgeInsets.symmetric(vertical: SizesConfig.xs),
        child: Container(
          decoration: BoxDecoration(
            color: (pageNum == currentPage)
                ? Theme.of(context).colorScheme.surfaceContainer
                : Colors.transparent,
            borderRadius: BorderRadius.circular(SizesConfig.borderRadiusSm),
            border: Border.all(
              color: (pageNum == currentPage)
                  ? Theme.of(context).dividerColor
                  : Colors.transparent,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Icon(
                  icon,
                  color: (pageNum == currentPage)
                      ? Theme.of(context).focusColor
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              Text(
                itemName,
                style: AppTextStyles.labelSmall(
                  color: (pageNum == currentPage)
                      ? Theme.of(context).focusColor
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
