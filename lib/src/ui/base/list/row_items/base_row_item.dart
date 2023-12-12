import 'package:flutter/material.dart';

class BaseRowItem extends StatelessWidget {
  final Widget child;

  final double? fixedWidth;

  final int? flex;

  const BaseRowItem({
    super.key,
    required this.child,
    this.fixedWidth,
    this.flex,
  });

  @override
  Widget build(BuildContext context) {
    return fixedWidth == null
        ? Expanded(
            flex: flex ?? 1,
            child: child,
          )
        : SizedBox(
            width: fixedWidth,
            child: child,
          );
  }
}
