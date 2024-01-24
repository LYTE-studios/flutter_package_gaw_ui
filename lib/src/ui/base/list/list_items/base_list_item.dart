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
      widgets.length - 1,
      const Spacer(),
    );
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    items.forEach((widget, width) {
      widgets.add(
        SizedBox(
          width: width,
          child: widget,
        ),
      );
    });

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingSizes.bigPadding,
      ),
      child: Container(
        height: 56,
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
      ),
    );
  }
}
