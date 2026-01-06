import 'package:riverpod/riverpod.dart';

final Provider<dynamic> appLocaleProvider = Provider<String>((
  Ref<Object?> ref,
) {
  return 'Test';
});
