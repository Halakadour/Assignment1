import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../config/constant/assets_path.dart';
import '../../config/router/app_route_config.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    Future.delayed(const Duration(seconds: 5), () {
      context.pushReplacementNamed(AppRouteConfig.login);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(AnimationsPath.loading, width: 150, height: 150),
      ),
    );
  }
}
