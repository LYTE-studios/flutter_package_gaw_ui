import 'package:flutter/material.dart';

class ColorlessInkWell extends StatelessWidget {
  final Widget child;

  final Function()? onTap;

  final Function()? onHover;
  final Function()? onExitHover;

  const ColorlessInkWell({
    super.key,
    required this.child,
    this.onTap,
    this.onHover,
    this.onExitHover,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onHover: (bool value) {
        if (value) {
          onHover?.call();
        } else {
          onExitHover?.call();
        }
      },
      onTap: onTap,
      child: child,
    );
  }
}
