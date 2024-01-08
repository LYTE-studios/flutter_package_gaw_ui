import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class BaseListItem extends StatelessWidget {
  final Map<Widget, double> items;

  const BaseListItem({
    super.key,
    required this.items,
  });

  static List<Widget> inflateRow(List<Widget> widgets) {
    widgets.insert(
      widgets.length - 2,
      const Spacer(),
    );
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    for (Widget widgetKey in items.keys) {
      widgets.add(
        SizedBox(
          width: items[widgetKey],
          child: widgetKey,
        ),
      );
    }

    return Container(
      height: 42,
      decoration: const BoxDecoration(
        border: Border(
          bottom: Borders.lightSide,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSizes.smallPadding,
        ),
        child: Row(
          children: inflateRow(widgets),
        ),
      ),
    );
  }
}
