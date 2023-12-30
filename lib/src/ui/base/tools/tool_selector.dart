import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ToolSelector extends StatelessWidget {
  final Color? color;

  const ToolSelector({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 56,
      decoration: BoxDecoration(
        color: color ?? GawTheme.toolBarItem,
        borderRadius: BorderRadius.circular(2.7),
      ),
    );
  }
}
