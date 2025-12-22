import 'package:go_router/go_router.dart';

import '../../features/agents/presentation/pages/agents_page.dart';
import '../../features/agents/presentation/pages/transaction_page.dart';
import '../../features/auth/presentation/pages/login/login_page.dart';
import '../../features/auth/presentation/pages/sign-up/sign_up_page.dart';
import '../../features/splash/splash_page.dart';
import '../../root_page.dart';
import 'app_route_config.dart';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // SPLASH
      GoRoute(
        name: AppRouteConfig.splash,
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      // AUTH PAGES
      GoRoute(
        name: AppRouteConfig.login,
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        name: AppRouteConfig.signup,
        path: '/signup',
        builder: (context, state) => const SignUpPage(),
      ),
      // MAIN WEB APP PAGES
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => RootPage(shell: shell),
        branches: [
          // Agents Branch
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRouteConfig.agents,
                path: '/agents',
                builder: (context, state) => const AgentsPage(),
                routes: [
                  GoRoute(
                    name: AppRouteConfig.transactions,
                    path: 'transactions/:id',
                    builder: (context, state) =>
                        TransactionPage(id: state.pathParameters['id'] ?? ''),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
