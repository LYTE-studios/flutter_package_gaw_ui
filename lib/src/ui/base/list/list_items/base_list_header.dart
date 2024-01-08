import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class BaseListHeader extends StatelessWidget {
  final Map<String, double> items;

  const BaseListHeader({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    for (String label in items.keys) {
      widgets.add(
        SizedBox(
          width: items[label],
          child: MainText(label),
        ),
      );
    }

    return Container(
      height: 56,
      decoration: const BoxDecoration(
        border: Border(
          bottom: Borders.mainSide,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSizes.smallPadding,
        ),
        child: Row(
          children: widgets,
        ),
      ),
    );
  }
}
