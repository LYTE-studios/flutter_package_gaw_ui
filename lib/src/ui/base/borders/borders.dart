import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class Borders {
  static const BorderSide mainSide = BorderSide(
    color: GawTheme.unselectedText,
    width: 0.3,
  );

  static const BorderSide lightSide = BorderSide(
    color: GawTheme.unselectedText,
    width: 0.1,
  );

  static const BorderSide mainTintLightSide = BorderSide(
    color: GawTheme.mainTint,
    width: 0.1,
  );

  static const BorderSide unselectedInputSide = BorderSide(
    color: GawTheme.unselectedText,
    width: 1,
  );

  static const BorderSide selectedInputSide = BorderSide(
    color: GawTheme.mainTint,
    width: 1,
  );
}
