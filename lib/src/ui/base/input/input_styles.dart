import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

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
      borderSide: Borders.mainSide.copyWith(
        color: GawTheme.unselectedBackground,
        width: 0.3,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    contentPadding: const EdgeInsets.all(
      PaddingSizes.extraSmallPadding,
    ),
  );

  static InputDecoration largeLightDecoration = InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: Borders.lightSelectedInputSide.copyWith(
        color: GawTheme.mainTint,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    border: OutlineInputBorder(
      borderSide: Borders.lightUnselectedInputSide.copyWith(
        color: GawTheme.unselectedBackground,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: Borders.lightUnselectedInputSide.copyWith(
        color: GawTheme.unselectedBackground,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    contentPadding: const EdgeInsets.all(
      PaddingSizes.smallPadding,
    ),
  );
}
