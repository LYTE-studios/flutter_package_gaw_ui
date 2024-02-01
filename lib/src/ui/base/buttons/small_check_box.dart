import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class SmallCheckBox extends StatelessWidget {
  final bool value;

  final Function()? onToggle;

  final Color? color;

  const SmallCheckBox({
    super.key,
    required this.value,
    this.onToggle,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ColorlessInkWell(
      onTap: onToggle,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: value ? color ?? GawTheme.secondaryTint : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: value
              ? null
              : Border.all(
                  width: 1,
                  color: GawTheme.unselectedText,
                ),
        ),
        child: value
            ? const SvgIcon(
                PixelPerfectIcons.checkMedium,
                color: GawTheme.mainTintText,
              )
            : const SizedBox(),
      ),
    );
  }
}
