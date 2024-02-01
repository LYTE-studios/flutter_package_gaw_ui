import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class TextRowItem extends StatelessWidget {
  final String? value;

  final double? fixedWidth;

  const TextRowItem({
    super.key,
    this.value,
    this.fixedWidth,
  });

  @override
  Widget build(BuildContext context) {
    return BaseRowItem(
      child: SizedBox(
        width: fixedWidth,
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
      ),
    );
  }
}
