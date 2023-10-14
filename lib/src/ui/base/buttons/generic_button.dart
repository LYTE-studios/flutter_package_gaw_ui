import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class GenericButton extends StatelessWidget {
  final String? label;

  final Function()? onTap;

  final Color? color;

  final Color? textColor;

  final TextStyle? textStyleOverride;

  const GenericButton({
    super.key,
    this.label,
    this.onTap,
    this.color,
    this.textColor,
    this.textStyleOverride,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 120,
          minHeight: 40,
        ),
        decoration: BoxDecoration(
          color: color ?? GawTheme.mainTint,
          borderRadius: BorderRadius.circular(12),
        ),
        alignment: Alignment.center,
        child: Center(
          child: MainText(
            label ?? '',
            alignment: TextAlign.center,
            textStyleOverride: textStyleOverride ??
                TextStyles.mainStyleTitle.copyWith(
                  fontSize: 18,
                  color: textColor ?? GawTheme.mainTintText,
                ),
          ),
        ),
      ),
    );
  }
}
