import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class BaseListItem extends StatelessWidget {
  final List<Widget> items;

  const BaseListItem({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: const BoxDecoration(
        border: Border(
          bottom: Borders.mainSide,
        ),
      ),
      child: Row(
        children: items,
      ),
    );
  }
}
