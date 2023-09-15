import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class UnselectedBlur extends StatelessWidget {
  const UnselectedBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 100,
            sigmaY: 100,
            tileMode: TileMode.decal,
          ),
        ),
        Container(
          color: GawTheme.blur,
        ),
      ],
    );
  }
}
