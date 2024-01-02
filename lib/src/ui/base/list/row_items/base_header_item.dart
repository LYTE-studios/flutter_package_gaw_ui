import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/list/row_items/base_row_item.dart';

class BaseHeaderItem extends StatelessWidget {
  final String label;

  final double? fixedWidth;

  final int? flex;

  const BaseHeaderItem({
    super.key,
    required this.label,
    this.fixedWidth,
    this.flex,
  });

  @override
  Widget build(BuildContext context) {
    return BaseRowItem(
      fixedWidth: fixedWidth,
      flex: flex,
      child: MainText(
        label,
      ),
    );
  }
}
