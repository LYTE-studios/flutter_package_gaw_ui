import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

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
          bottom: Borders.lightSide,
        ),
      ),
      child: Row(
        children: items,
      ),
    );
  }
}
