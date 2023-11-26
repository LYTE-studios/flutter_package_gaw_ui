import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class BottomShadow extends StatelessWidget {
  const BottomShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        boxShadow: [
          Shadows.bottomShadow,
        ],
      ),
    );
  }
}
