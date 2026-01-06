import 'package:flutter/material.dart';
import 'package:portfolio_website/routes/app_routes.dart';

class AppMenuList {
  static List<AppMenu> getItems(BuildContext context) {
    return [
      AppMenu(title: 'Home', path: Routes.home),
      AppMenu(title: 'Projects', path: Routes.projects),
      AppMenu(title: 'Blog', path: Routes.blog),
      AppMenu(title: 'About', path: Routes.about),
    ];
  }
}

class AppMenu {
  final String title;
  final String path;

  AppMenu({required this.title, required this.path});
}
