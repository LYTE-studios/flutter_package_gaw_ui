import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/buttons/small_check_box.dart';

class BigCheckBox extends StatelessWidget {
  final Function(bool value)? onTap;

  final bool value;

  final String? label;

  const BigCheckBox({
    super.key,
    this.onTap,
    this.value = false,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call(!value);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: value ? GawTheme.secondaryTint : GawTheme.unselectedText,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingSizes.bigPadding,
              ),
              child: SmallCheckBox(
                value: value,
              ),
            ),
            MainText(
              label ?? '',
              color: value ? GawTheme.secondaryTint : GawTheme.text,
            ),
          ],
        ),
      ),
    );
  }
}
