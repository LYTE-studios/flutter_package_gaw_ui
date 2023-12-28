import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

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
