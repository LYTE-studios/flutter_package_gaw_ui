import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class InputStyles {
  static InputDecoration mainDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    contentPadding: const EdgeInsets.all(
      PaddingSizes.extraSmallPadding,
    ),
  );

  static InputDecoration largeDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderSide: Borders.mainSide,
      borderRadius: BorderRadius.circular(8),
    ),
    contentPadding: const EdgeInsets.all(
      PaddingSizes.extraSmallPadding,
    ),
  );
}
