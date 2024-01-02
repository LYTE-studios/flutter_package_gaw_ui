import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

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
