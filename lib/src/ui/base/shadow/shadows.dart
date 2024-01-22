import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class Shadows {
  static const BoxShadow mainShadow = BoxShadow(
    color: GawTheme.shadow,
    offset: Offset(4, 12),
    blurRadius: 16,
  );

  static const BoxShadow heavyShadow = BoxShadow(
    color: GawTheme.darkShadow,
    blurRadius: 21,
  );

  static const BoxShadow bottomShadow = BoxShadow(
    color: GawTheme.darkShadow,
    offset: Offset(0, 48),
    blurRadius: 21,
  );

  static const BoxShadow lightShadow = BoxShadow(
    color: GawTheme.shadow,
    spreadRadius: 2,
    blurRadius: 3,
  );

  static const BoxShadow bottomSheetShadow = BoxShadow(
    color: GawTheme.shadow,
    offset: Offset(
      0,
      -2,
    ),
    spreadRadius: 2,
    blurRadius: 3,
  );
}
