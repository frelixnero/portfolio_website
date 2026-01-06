import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:portfolio_website/routes/app_routes.dart';
import 'package:portfolio_website/shared_pref/app_theme_controller.dart';
import 'package:portfolio_website/util/theme/app_theme.dart';
import 'package:seo/seo.dart'; // New SEO package

void main() {
  // For proper web URLs

  usePathUrlStrategy();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeControllerProvider);

    return SeoController(
      enabled: true, // Enable SEO
      tree: WidgetTree(context: context), // Build SEO tree
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        darkTheme: AppTheme().dark,
        theme: AppTheme().light,
        routerConfig: AppRoutes.router,
        themeMode: theme.value,
      ),
    );
  }
}
