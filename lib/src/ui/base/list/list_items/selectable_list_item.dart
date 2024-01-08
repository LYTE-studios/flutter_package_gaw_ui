import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class SelectableListItem extends StatelessWidget {
  final Function()? onSelected;
  final Map<Widget, double> items;

  const SelectableListItem({
    super.key,
    required this.onSelected,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelected,
      child: BaseListItem(
        items: items,
      ),
    );
  }
}
