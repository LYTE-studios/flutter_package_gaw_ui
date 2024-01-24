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

    items.forEach(
      (label, width) {
        widgets.add(
          SizedBox(
            width: width,
            child: BaseHeaderItem(
              label: label,
            ),
          ),
        );
      },
    );

    widgets.add(
      const Spacer(),
    );

    return Container(
      height: 45,
      decoration: const BoxDecoration(
        color: GawTheme.clearBackground,
        border: Border(
          top: Borders.lightSide,
          bottom: Borders.lightSide,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSizes.smallPadding + PaddingSizes.bigPadding,
        ),
        child: Row(
          children: widgets,
        ),
      ),
    );
  }
}
