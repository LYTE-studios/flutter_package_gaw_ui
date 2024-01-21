import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/loading/loading_spinner.dart';

class EditButton extends StatelessWidget {
  final String? label;

  final Function()? onTap;

  final Color? color;

  final Color? textColor;

  final double? fontSize;

  final TextStyle? textStyleOverride;

  final EdgeInsetsGeometry? padding;

  final double minHeight;

  const EditButton({
    super.key,
    this.label,
    this.onTap,
    this.color,
    this.textColor,
    this.textStyleOverride,
    this.fontSize,
    this.padding,
    this.minHeight = 45,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          constraints: BoxConstraints(
            minWidth: 120,
            minHeight: minHeight,
          ),
          decoration: BoxDecoration(
            color: color ?? GawTheme.mainTint,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              Shadows.mainShadow,
            ],
            border: Border.all(color: GawTheme.unselectedBackground),
          ),
          padding: padding,
          alignment: Alignment.center,
          child: Center(
              child: Row(
            children: [
              const SizedBox(
                width: 10.5,
                height: 10.5,
                child: SvgIcon(PixelPerfectIcons.editNormal),
              ),
              const SizedBox(width: PaddingSizes.extraSmallPadding),
              MainText(
                label ?? '',
                alignment: TextAlign.center,
                textStyleOverride: textStyleOverride ??
                    TextStyles.mainStyleTitle.copyWith(
                      fontSize: fontSize ?? 18,
                      color: textColor ?? GawTheme.text,
                    ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
