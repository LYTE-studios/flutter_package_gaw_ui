import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/list/row_items/base_row_item.dart';

class ActionButtonRowItem extends StatelessWidget {
  final String label;

  final Function()? onTap;

  final Alignment alignment;

  const ActionButtonRowItem({
    super.key,
    required this.label,
    this.onTap,
    this.alignment = Alignment.centerRight,
  });

  @override
  Widget build(BuildContext context) {
    return BaseRowItem(
      alignment: alignment,
      child: Center(
        child: SizedBox(
          width: 178,
          child: ActionButton(
            label: label,
            height: 64,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
