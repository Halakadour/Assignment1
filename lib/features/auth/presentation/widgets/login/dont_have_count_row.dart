import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:i18n_extension/default.i18n.dart';

import '../../../../../config/router/app_route_config.dart';

class DontHaveAccountRow extends StatelessWidget {
  const DontHaveAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "Don't Have An Account ? ",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        TextButton(
          onPressed: () => context.pushReplacementNamed(AppRouteConfig.signup),
          child: Text("Sign Up".i18n),
        ),
      ],
    );
  }
}
