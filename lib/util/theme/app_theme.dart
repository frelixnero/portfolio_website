import 'package:flutter/material.dart';
import 'package:portfolio_website/util/constants/app_size.dart';
import 'package:portfolio_website/util/theme/app_color.dart';

class AppTheme {
  ThemeData get dark {
    return _getThemeData(
      colorScheme: ColorScheme.dark(
        primary: AppColor.primaryColor,
        background: AppColor.darkBackgroundColor,
        onBackground: AppColor.gray[100],
        surface: AppColor.gray[800]!,
        outline: AppColor.gray[850]!,
        outlineVariant: AppColor.gray[700]!,
        onSurface: AppColor.gray[300]!,
        onSurfaceVariant: AppColor.gray[400]!,
        tertiary: AppColor.gray[900]!,
      ),
      elevatedButtonTextStyle: _darkElevatedButtonTextStyle,
      outlineButtonTextStyle: _darkOutlinedButtonTextStyle,
      scaffoldBackGroundColor: AppColor.darkBackgroundColor,
      appBarTheme: AppBarTheme(color: AppColor.gray[900]!.withOpacity(0.3)),
    );
  }

  ThemeData get light {
    return _getThemeData(
      colorScheme: ColorScheme.light(
        primary: AppColor.primaryColor,
        background: AppColor.gray[100],
        onBackground: AppColor.gray[800]!,
        surface: AppColor.gray[200]!,
        outline: AppColor.gray[300]!,
        outlineVariant: AppColor.gray[400]!,
        onSurface: AppColor.gray[700]!,
        onSurfaceVariant: AppColor.gray[600]!,
        tertiary: AppColor.gray[900]!,
      ),

      elevatedButtonTextStyle: _lightElevatedButtonTextStyle,
      outlineButtonTextStyle: _lightOutlinedButtonTextStyle,
      scaffoldBackGroundColor: AppColor.darkBackgroundColor,
      appBarTheme: AppBarTheme(color: AppColor.gray[900]!.withOpacity(0.3)),
    );
  }

  ThemeData _getThemeData({
    required ColorScheme colorScheme,
    required WidgetStateProperty<TextStyle> elevatedButtonTextStyle,
    required WidgetStateProperty<TextStyle> outlineButtonTextStyle,
    required Color scaffoldBackGroundColor,
    required AppBarTheme appBarTheme,
  }) {
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      fontFamily: "Sora-SemiBold",
      scaffoldBackgroundColor: scaffoldBackGroundColor,
      appBarTheme: appBarTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size.fromHeight(40)),
          backgroundColor: _primaryButtonStates,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Inserts.xl, vertical: 10),
          ),
          textStyle: elevatedButtonTextStyle,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size.fromHeight(40)),
          side: _outlineButtonStates,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Inserts.xl, vertical: 10),
          ),
          textStyle: outlineButtonTextStyle,
        ),
      ),
    );
  }

  // button states
  final _primaryButtonStates = WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.hovered) ||
        states.contains(WidgetState.pressed)) {
      return const Color(0xFF561895).withOpacity(0.7);
    }
    return AppColor.primaryColor;
  });
  final _outlineButtonStates = WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.hovered) ||
        states.contains(WidgetState.pressed)) {
      return BorderSide(color: const Color(0xFF561895).withOpacity(0.7));
    }
    return const BorderSide(color: Color(0xFF561895));
  });

  WidgetStatePropertyAll<TextStyle> get _darkElevatedButtonTextStyle =>
      WidgetStatePropertyAll(
        TextStyle(
          color: AppColor.gray[100]!,
          fontFamily: "Sora-SemiBold",
          fontWeight: FontWeight.w500,
        ),
      );
  WidgetStatePropertyAll<TextStyle> get _lightElevatedButtonTextStyle =>
      WidgetStatePropertyAll(
        TextStyle(
          color: AppColor.gray[100]!,
          fontFamily: "Sora-SemiBold",
          fontWeight: FontWeight.w500,
        ),
      );
  WidgetStatePropertyAll<TextStyle> get _darkOutlinedButtonTextStyle =>
      WidgetStatePropertyAll(
        TextStyle(
          color: AppColor.gray[100]!,
          fontFamily: "Sora-SemiBold",
          fontWeight: FontWeight.w500,
        ),
      );
  WidgetStatePropertyAll<TextStyle> get _lightOutlinedButtonTextStyle =>
      WidgetStatePropertyAll(
        TextStyle(
          color: AppColor.gray[800]!,
          fontFamily: "Sora-SemiBold",
          fontWeight: FontWeight.w500,
        ),
      );
}
