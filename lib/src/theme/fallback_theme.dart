import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

final ThemeData fallbackTheme = ThemeData(
  primaryColor: GawTheme.mainTint,
  focusColor: GawTheme.mainTint,
  indicatorColor: GawTheme.mainTint,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    circularTrackColor: GawTheme.mainTint,
  ),
  cupertinoOverrideTheme: const CupertinoThemeData(
    primaryColor: GawTheme.mainTint,
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: Borders.selectedInputSide,
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: Borders.unselectedInputSide,
      borderRadius: BorderRadius.circular(8),
    ),
    border: OutlineInputBorder(
      borderSide: Borders.lightSide,
      borderRadius: BorderRadius.circular(8),
    ),
    fillColor: GawTheme.mainTint,
    labelStyle: TextStyles.mainStyle,
    floatingLabelStyle: TextStyles.mainStyle.copyWith(
      color: GawTheme.mainTint,
    ),
    focusColor: GawTheme.mainTint,
    hoverColor: GawTheme.mainTint,
    errorStyle: TextStyles.mainStyle.copyWith(
      color: GawTheme.error,
    ),
  ),
);
