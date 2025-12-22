import 'package:flutter/material.dart';
import 'package:i18n_extension/default.i18n.dart';

import '../../../../../config/scales/sizes_config.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: SizesConfig.spaceBtwItems),
          Text(
            "Make new account".i18n,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            "Please sign up to continue".i18n,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
