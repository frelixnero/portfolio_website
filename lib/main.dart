import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/routes/app_routes.dart';
import 'package:portfolio_website/shared_pref/app_theme_controller.dart';
import 'package:portfolio_website/util/theme/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(appThemeControllerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme().dark,
      theme: AppTheme().light,
      routerConfig: AppRoutes.router,
      themeMode: theme.value,
    );
  }
}
