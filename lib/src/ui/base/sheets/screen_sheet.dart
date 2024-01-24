import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ScreenSheet extends StatelessWidget {
  final Widget child;
  final double topPadding;
  final bool hasBackground;

  const ScreenSheet({
    super.key,
    this.topPadding = 0,
    this.hasBackground = true,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingSizes.mainPadding,
      ).copyWith(top: topPadding),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height - topPadding,
        decoration: BoxDecoration(
          color: hasBackground ? GawTheme.clearText : Colors.transparent,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: child,
      ),
    );
  }
}
