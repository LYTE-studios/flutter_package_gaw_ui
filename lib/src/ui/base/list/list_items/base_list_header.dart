import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class BaseListHeader extends StatelessWidget {
  final List<Widget> widgets;

  const BaseListHeader({
    super.key,
    required this.widgets,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        border: Border(
          bottom: Borders.mainSide,
        ),
      ),
      child: Row(
        children: widgets,
      ),
    );
  }
}