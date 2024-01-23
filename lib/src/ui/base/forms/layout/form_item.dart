import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class FormItem extends StatelessWidget {
  final Widget child;

  final int? flex;

  const FormItem({super.key, required this.child, this.flex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: PaddingSizes.extraSmallPadding,
          horizontal: PaddingSizes.smallPadding,
        ),
        child: child,
      ),
    );
  }
}
