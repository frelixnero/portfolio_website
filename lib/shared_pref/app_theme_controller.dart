import 'package:flutter/material.dart';
import 'package:portfolio_website/shared_pref/app_shared_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../models/app_theme_controller.g.dart';

@riverpod
class AppThemeController extends _$AppThemeController {
  @override
  Future<ThemeMode> build() {

    return AppSharedPref.getAppTheme();
  }

  void changeTheme(ThemeMode themeMode)async{
    await AppSharedPref.setAppTheme(themeMode == ThemeMode.dark ? "dark" : "light");
    update((state) => themeMode);
  }
}