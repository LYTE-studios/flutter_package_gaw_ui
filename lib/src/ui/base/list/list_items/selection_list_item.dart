import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class SelectionListItem extends StatelessWidget {
  final Function()? onSelected;
  final Map<Widget, double> items;

  final bool selected;
  final Function(bool?)? onUpdate;

  const SelectionListItem({
    super.key,
    required this.onSelected,
    required this.items,
    this.selected = false,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return ColorlessInkWell(
      onTap: onSelected,
      child: Row(
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
            child: BaseListItem(
              items: items,
            ),
          ),
        ],
      ),
    );
  }
}
