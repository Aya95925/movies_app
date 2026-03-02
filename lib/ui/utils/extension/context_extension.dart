import 'package:flutter/material.dart';
import 'package:movies/ui/utils/app_theme.dart';

String x = "";

extension SDASSD on String {
  void ahmed() {}
}

extension BuildContextExtension on BuildContext {
  Color get secondaryColor => AppTheme.darkTheme.colorScheme.secondary;

  Color get primaryColor => AppTheme.darkTheme.primaryColor;

  TextTheme get textTheme => AppTheme.darkTheme.textTheme;
}
