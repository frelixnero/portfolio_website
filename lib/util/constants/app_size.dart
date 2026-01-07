class Inserts {
  static double get med => 12;
  static double get xs => 4;
  static double get lg => 18;
  static double get xl => 24;
  static double get xxl => 36;
  static double get xxxl => 80;

  static const double maxWidth = 1280;
}

abstract class AppInserts {
  double get padding;
  double get appBarHeight;
  double get cardPadding;
  double get gap;
}

class LargeInserts extends AppInserts {
  @override
  double get padding => 80;

  @override
  double get appBarHeight => 64;

  @override
  double get cardPadding => Inserts.xl;

  @override
  // TODO: implement gap
  double get gap => 120;
}

class MediumInserts extends AppInserts {
  @override
  double get padding => 35;

  @override
  double get appBarHeight => 60;

  @override
  double get cardPadding => Inserts.xl;

  @override
  // TODO: implement gap
  double get gap => 90;
}

class SmallInserts extends AppInserts {
  @override
  double get padding => 16;

  @override
  double get appBarHeight => 54;

  @override
  double get cardPadding => Inserts.lg;

  @override
  double get gap => 72;
}
