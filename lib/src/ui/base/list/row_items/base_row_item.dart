import 'package:flutter/material.dart';

class BaseRowItem extends StatelessWidget {
  final Widget child;

  const BaseRowItem({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
