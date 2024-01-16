import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ScreenSheet extends StatelessWidget {
  final Widget child;
  final double topPadding;

  const ScreenSheet({
    super.key,
    this.topPadding = 0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingSizes.mainPadding,
      ).copyWith(top: topPadding),
      child: Container(
        decoration: const BoxDecoration(
          color: GawTheme.clearText,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: child,
      ),
    );
  }
}
