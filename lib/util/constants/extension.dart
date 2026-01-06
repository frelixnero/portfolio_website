import 'package:flutter/material.dart';
import 'package:portfolio_website/util/constants/app_size.dart';
import 'package:portfolio_website/util/theme/app_text_style.dart';

enum FormFactorType { mobile, tablet, desktop }

extension StyledContext on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);
  double get width => mq.size.width;
  double get height => mq.size.height;

  ThemeData get theme => Theme.of(this);

  FormFactorType get formFactor {
    if (width < 600) {
      return FormFactorType.mobile;
    } else if (width < 900) {
      return FormFactorType.tablet;
    } else {
      return FormFactorType.desktop;
    }
  }

  bool get isMobile => formFactor == FormFactorType.mobile;
  bool get isTablet => formFactor == FormFactorType.tablet;
  bool get isDesktop => formFactor == FormFactorType.desktop;

  AppTextStyle get textStyle {
    switch (formFactor) {
      case FormFactorType.mobile:
      case FormFactorType.tablet:
        return SmallTextStyle();
      case FormFactorType.desktop:
        return LargeTextStyle();
    }
  }

  AppInserts get inserts {
    switch (formFactor) {
      case FormFactorType.mobile:
        return SmallInserts();
      case FormFactorType.tablet:
        return MediumInserts();
      case FormFactorType.desktop:
        return LargeInserts();
    }
  }
}
