import 'package:flutter/material.dart';

import '../../../../../../core/widgets/layouts/templates/login_template.dart';
import '../../../widgets/sign-up/sign_up_form.dart';
import '../../../widgets/sign-up/sign_up_header.dart';

class SignUpDesktopTablet extends StatelessWidget {
  const SignUpDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginTemplate(
      child: Column(
        children: [
          // Header
          SignUpHeader(),
          // Form
          SignUpForm(),
        ],
      ),
    );
  }
}
