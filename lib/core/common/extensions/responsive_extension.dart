import 'package:flutter/material.dart';

extension ResponsiveConstraint on BoxConstraints {
  bool get isMobile => smallest.shortestSide < 600; 
  bool get isTablet => smallest.shortestSide >= 600 && smallest.shortestSide < 900;
  bool get isDesktop => smallest.shortestSide >= 900;
}