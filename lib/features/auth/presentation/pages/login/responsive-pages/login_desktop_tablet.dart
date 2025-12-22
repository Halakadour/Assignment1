import 'package:flutter/material.dart';

import '../../../../../../core/widgets/layouts/templates/login_template.dart';
import '../../../widgets/login/login_form.dart';
import '../../../widgets/login/login_header.dart';

class LoginDesktopTablet extends StatelessWidget {
  const LoginDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginTemplate(
      child: Column(
        children: [
          // Header
          LoginHeader(),
          // Form
          LoginForm(),
        ],
      ),
    );
  }
}
