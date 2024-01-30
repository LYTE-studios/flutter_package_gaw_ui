import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class SelectionListHeader extends StatelessWidget {
  final Map<String, double> items;

  final bool selected;
  final Function(bool?)? onUpdate;

  const SelectionListHeader({
    super.key,
    required this.items,
    this.selected = false,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: PaddingSizes.bigPadding,
          ),
          child: Checkbox(
            value: selected,
            onChanged: onUpdate,
          ),
        ),
        Expanded(
          child: BaseListHeader(
            items: items,
          ),
        ),
      ],
    );
  }
}
