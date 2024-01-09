import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/list/row_items/base_row_item.dart';

class IconRowItem extends StatelessWidget {
  final String icon;

  const IconRowItem({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        BaseRowItem(
          fixedWidth: 16,
          child: SvgIcon(
            icon,
            color: GawTheme.unselectedText,
          ),
        ),
      ],
    );
  }
}
