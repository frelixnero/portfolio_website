import 'package:flutter/material.dart';
import 'package:portfolio_website/components/language_toggle_item.dart';
import 'package:portfolio_website/util/constants/app_assets.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: (int value) {
        if (value == 0) {
        } else {}
      },
      icon: Icon(Icons.more),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 0,
            child: LanguageToggleItem(
              language: "English",
              icon: AppAssets.usFlag,
            ),
          ),
          PopupMenuItem(
            value: 1,
            child: LanguageToggleItem(
              language: "UK English",
              icon: AppAssets.usFlag,
            ),
          ),
        ];
      },
    );
  }
}
