import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class ToolSelector extends StatelessWidget {
  const ToolSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 56,
      decoration: BoxDecoration(
        color: GawTheme.toolBarItem,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
