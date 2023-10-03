import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/ui/base/list/row_items/base_row_item.dart';

class SelectableTextRowItem extends StatelessWidget {
  final String? value;

  final double? fixedWidth;

  final int? flex;

  const SelectableTextRowItem({
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
      child: GestureDetector(
        onTap: () {
          if (value == null) {
            return;
          }

          Clipboard.setData(
            ClipboardData(
              text: value ?? '',
            ),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            MainText(
              value ?? '',
              alignment: TextAlign.left,
            ),
            Visibility(
              visible: value != null,
              child: const SvgIcon(
                PixelPerfectIcons.documentNormal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
