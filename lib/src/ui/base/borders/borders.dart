import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class Borders {
  static const BorderSide mainSide = BorderSide(
    color: GawTheme.unselectedText,
    width: 0.3,
  );

  static const BorderSide lightSide = BorderSide(
    color: GawTheme.unselectedText,
    width: 0.1,
  );

  static const BorderSide unselectedInputSide = BorderSide(
    color: GawTheme.unselectedText,
    width: 2,
  );

  static const BorderSide selectedInputSide = BorderSide(
    color: GawTheme.mainTint,
    width: 2,
  );
}
