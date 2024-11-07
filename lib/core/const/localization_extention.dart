import 'package:flutter/material.dart';

import '../../localization_test_screen.dart';

extension LocalizationExtension on BuildContext {
  String get localization => ChangeLocalization.of(this)?.localization ?? 'ar';
}
