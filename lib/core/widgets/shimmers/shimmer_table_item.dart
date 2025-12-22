import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../config/scales/sizes_config.dart';

class ShimmerTableItem extends StatelessWidget {
  const ShimmerTableItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).dividerColor,
      highlightColor: Theme.of(context).colorScheme.surfaceContainer,
      child: Container(
        height: 20,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(SizesConfig.borderRadiusXs),
        ),
      ),
    );
  }
}
