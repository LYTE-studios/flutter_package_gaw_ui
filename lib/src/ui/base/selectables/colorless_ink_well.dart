import 'package:flutter/material.dart';

class ColorlessInkWell extends StatelessWidget {
  final Widget child;

  final Function()? onTap;

  const ColorlessInkWell({
    super.key,
    required this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: child,
    );
  }
}
