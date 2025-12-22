import 'package:flutter/material.dart';

import '../../../../../core/widgets/responsive/responsive_design.dart';
import 'responsive-pages/sign_up_desktop_tablet.dart';
import 'responsive-pages/sign_up_mobile.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomResponsiveDesign(
      desktop: const SignUpDesktopTablet(),
      tablet: const SignUpDesktopTablet(),
      mobile: const SignUpMobile(),
    );
  }
}
