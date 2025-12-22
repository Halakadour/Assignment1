import 'package:flutter/material.dart';

import '../../../../../../config/scales/sizes_config.dart';
import '../../../widgets/sign-up/sign_up_form.dart';
import '../../../widgets/sign-up/sign_up_header.dart';

class SignUpMobile extends StatelessWidget {
  const SignUpMobile({super.key});

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
              SignUpHeader(),
              //Form
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
