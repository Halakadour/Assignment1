import 'package:flutter/material.dart';

import '../../../../../core/widgets/responsive/responsive_design.dart';
import 'responsive-pages/login_desktop_tablet.dart';
import 'responsive-pages/login_mobile.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomResponsiveDesign(
      desktop: const LoginDesktopTablet(),
      tablet: const LoginDesktopTablet(),
      mobile: const LoginMobile(),
    );
  }
}
