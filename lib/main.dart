import 'package:assignment_1/config/constant/app_env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config/router/app_router.dart';
import 'config/theme/theme_data/theme_data_dark.dart';
import 'config/theme/theme_data/theme_data_light.dart';
import 'core/providers/theme_provider.dart';
import 'package:i18n_extension/i18n_extension.dart';

import 'translation/translation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyI18n.loadTranslations();
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(url: AppEnv.baseUrl, anonKey: AppEnv.annonKey);

  runApp(ProviderScope(child: I18n(autoSaveLocale: true, child: MainApp())));
}

// Get a reference for Supabase client
final supabase = Supabase.instance.client;

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      title: "Assignment 1",
      debugShowCheckedModeBanner: false,
      // Theming Thing //
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      themeMode: themeMode,
      // Localization Thing //
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'SA')],
      locale: I18n.locale,
      // Routing Thing //
      routerConfig: AppRouter().router,
      builder: (context, child) => child!,
    );
  }
}
