import 'package:flutter/material.dart';

extension IntExtensions on int {
  SizedBox verticalSpace() => SizedBox(height: toDouble());

  SizedBox horizontalSpace() => SizedBox(width: toDouble());
}
