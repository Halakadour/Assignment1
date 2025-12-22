import 'package:flutter/material.dart';

import '../../../../config/scales/padding_config.dart';

class LoginTemplate extends StatelessWidget {
  const LoginTemplate({super.key, required this.child, this.width});
  final Widget child;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(
        child: SizedBox(
          width: 550,
          child: SingleChildScrollView(
            child: Container(
              padding: PaddingConfig.paddingWithAppBarHeight,
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).dividerColor),
                borderRadius: BorderRadius.circular(8.0),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
