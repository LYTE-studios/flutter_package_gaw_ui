import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/list/row_items/base_row_item.dart';

class TextRowItem extends StatelessWidget {
  final String? value;

  final double? fixedWidth;

  final int? flex;

  const TextRowItem({
    super.key,
    this.value,
    this.fixedWidth,
    this.flex,
  });

  @override
  Widget build(BuildContext context) {
    return BaseRowItem(
      child: MainText(
        value ?? '',
        alignment: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        textStyleOverride: TextStyles.mainStyle.copyWith(
          color: GawTheme.specialText,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}
