import 'package:flutter/widgets.dart';

abstract class AppTextStyle {
  TextStyle get titleSmBold;
  TextStyle get bodyMdMedium;
  TextStyle get titleLgBold;
  TextStyle get titleMdMedium;
  TextStyle get bodyLgBold;
  TextStyle get bodyLgMedium;
}

class SmallTextStyle extends AppTextStyle {
  @override
  // bodyLgBold
  TextStyle get bodyLgBold =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold);

  @override
  // bodyLgMedium
  TextStyle get bodyLgMedium =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  @override
  // bodyMdMedium
  TextStyle get bodyMdMedium =>
      TextStyle(fontSize: 12, fontWeight: FontWeight.w500);

  @override
  // titleLgBold
  TextStyle get titleLgBold =>
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

  @override
  // titleMdMedium
  TextStyle get titleMdMedium =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  @override
  TextStyle get titleSmBold =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
}

class LargeTextStyle extends AppTextStyle {
  @override
  // bodyLgBold
  TextStyle get bodyLgBold =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  // bodyLgMedium
  TextStyle get bodyLgMedium =>
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

  @override
  // bodyMdMedium
  TextStyle get bodyMdMedium =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w500);

  @override
  // titleLgBold
  TextStyle get titleLgBold =>
      TextStyle(fontSize: 40, fontWeight: FontWeight.bold);

  @override
  // titleMdMedium
  TextStyle get titleMdMedium =>
      TextStyle(fontSize: 18, fontWeight: FontWeight.w500);

  @override
  TextStyle get titleSmBold =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
}
