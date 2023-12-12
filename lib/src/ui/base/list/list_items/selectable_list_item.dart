import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class SelectableListItem extends StatelessWidget {
  final Function()? onSelected;
  final List<Widget> items;

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
