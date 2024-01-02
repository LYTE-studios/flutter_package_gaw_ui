import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/list/row_items/base_row_item.dart';

class IconRowItem extends StatelessWidget {
  final String icon;

  final double? fixedWidth;

  final int? flex;

  const IconRowItem({
    super.key,
    required this.icon,
    this.fixedWidth,
    this.flex,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: BaseRowItem(
        fixedWidth: fixedWidth,
        flex: flex,
        child: SvgIcon(
          icon,
          color: GawTheme.unselectedText,
        ),
      ),
    );
  }
}
