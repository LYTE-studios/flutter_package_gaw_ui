import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/ui/base/list/row_items/base_row_item.dart';

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
      fixedWidth: fixedWidth,
      flex: flex,
      child: MainText(
        value ?? '',
        alignment: TextAlign.left,
      ),
    );
  }
}
