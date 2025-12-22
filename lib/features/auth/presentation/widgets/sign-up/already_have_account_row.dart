import 'package:assignment_1/translation/translation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/router/app_route_config.dart';

class AlreadyHaveAccountRow extends StatelessWidget {
  const AlreadyHaveAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "Already have an Account? ",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        TextButton(
          onPressed: () => context.pushReplacementNamed(AppRouteConfig.login),
          child: Text("Login".i18n),
        ),
      ],
    );
  }
}
