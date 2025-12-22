import 'package:flutter/material.dart';

import '../../../../../../config/scales/sizes_config.dart';
import '../../../widgets/login/login_form.dart';
import '../../../widgets/login/login_header.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(SizesConfig.defaultSpace),
          child: Column(
            children: [
              //Header
              LoginHeader(),
              //Form
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
