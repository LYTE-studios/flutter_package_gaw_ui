import 'package:flutter/material.dart';

class BaseRowItem extends StatelessWidget {
  final Widget child;

  final Alignment alignment;

  const BaseRowItem({
    super.key,
    required this.child,
    this.alignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: child,
    );
  }
}
