import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class StatusRowItem extends StatelessWidget {
  final String? value;

  final Color? color;

  final bool visible;

  const StatusRowItem({
    super.key,
    this.value,
    this.color,
    this.visible = true,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: BaseRowItem(
        child: Row(
          children: [
            MainText(
              '•',
              textStyleOverride: TextStyles.mainStyle.copyWith(
                color: color ?? GawTheme.success,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              width: PaddingSizes.extraSmallPadding,
            ),
            MainText(
              value ?? '',
              alignment: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              textStyleOverride: TextStyles.mainStyle.copyWith(
                color: color ?? GawTheme.success,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
