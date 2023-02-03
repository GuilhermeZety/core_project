import 'package:flutter/material.dart';

extension GetTheme on BuildContext{
   ThemeData get theme => Theme.of(this);
}
extension GetColorScheme on BuildContext{
   ColorScheme get colorScheme => Theme.of(this).colorScheme;
}