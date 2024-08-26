import 'package:flutter/material.dart';

extension SpaceExtension on int {
  Widget verticalSpace() => SizedBox(height: toDouble());
  Widget horizontalSpace() => SizedBox(width: toDouble());
}
