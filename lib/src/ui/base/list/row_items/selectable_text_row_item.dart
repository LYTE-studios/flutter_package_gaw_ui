import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/list/row_items/base_row_item.dart';
import 'package:gaw_ui/src/ui/base/snack_bars/basic_snack_bar.dart';

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
      child: ColorlessInkWell(
        onTap: () {
          if (value == null) {
            return;
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              elevation: 0,
              duration: const Duration(
                seconds: 1,
              ),
              backgroundColor: Colors.transparent,
              content: BasicSnackBar(
                title: 'Copied!',
                description:
                    '${value ?? 'something..'} got copied to your clipboard',
              ),
            ),
          );

          Clipboard.setData(
            ClipboardData(
              text: value ?? '',
            ),
          );
        },
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Visibility(
              visible: value != null,
              child: const Padding(
                padding: EdgeInsets.all(
                  PaddingSizes.extraSmallPadding,
                ),
                child: SizedBox(
                  height: 15,
                  width: 15,
                  child: SvgIcon(
                    PixelPerfectIcons.documentNormal,
                    color: GawTheme.unselectedText,
                  ),
                ),
              ),
            ),
            Expanded(
              child: MainText(
                value ?? '',
                alignment: TextAlign.left,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
