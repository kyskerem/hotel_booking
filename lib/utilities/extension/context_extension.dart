import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ThemeData get theme => Theme.of(this);
  double dynamicHeight(double number) =>
      MediaQuery.of(this).size.height * number;

  double dynamicWidth(double number) => MediaQuery.of(this).size.width * number;
}
