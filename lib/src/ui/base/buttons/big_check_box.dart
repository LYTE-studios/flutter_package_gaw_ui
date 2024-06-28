import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

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
        child: Padding(
          padding: const EdgeInsets.only(
            right: PaddingSizes.mainPadding,
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
              Expanded(
                child: MainText(
                  label ?? '',
                  alignment: TextAlign.left,
                  color: value ? GawTheme.secondaryTint : GawTheme.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
