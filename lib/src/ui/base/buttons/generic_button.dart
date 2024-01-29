import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class GenericButton extends StatelessWidget {
  final String? label;

  final Function()? onTap;

  final String? headerIcon;

  final Color? color;

  final Color? textColor;

  final double? fontSize;

  final TextStyle? textStyleOverride;

  final bool loading;

  final EdgeInsetsGeometry? padding;

  final double minHeight;
  final double minWidth;

  final bool outline;

  final double? radius;

  final String? icon;

  const GenericButton({
    super.key,
    this.label,
    this.onTap,
    this.headerIcon,
    this.color,
    this.textColor,
    this.textStyleOverride,
    this.fontSize,
    this.padding,
    this.loading = false,
    this.minHeight = 45,
    this.minWidth = 120,
    this.outline = false,
    this.radius,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ColorlessInkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(
          minWidth: minWidth,
          minHeight: minHeight,
        ),
        decoration: BoxDecoration(
          color: color ?? GawTheme.mainTint,
          borderRadius: BorderRadius.circular(radius ?? 5),
          border: !outline
              ? null
              : Border.fromBorderSide(
                  Borders.mainSide.copyWith(
                    color: GawTheme.secondaryTint,
                  ),
                ),
          boxShadow: const [
            Shadows.mainShadow,
          ],
        ),
        padding: padding,
        alignment: Alignment.center,
        child: LoadingSwitcher(
          loading: loading,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                visible: headerIcon != null,
                child: SvgIcon(
                  headerIcon ?? '',
                  color: textColor ?? GawTheme.mainTint,
                ),
              ),
              MainText(
                label ?? '',
                alignment: TextAlign.center,
                textStyleOverride: textStyleOverride ??
                    TextStyles.mainStyleTitle.copyWith(
                      fontSize: fontSize ?? 18,
                      color: textColor ?? GawTheme.mainTintText,
                    ),
              ),
              Visibility(
                visible: icon != null,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: PaddingSizes.mainPadding,
                  ),
                  child: SizedBox(
                    width: 21,
                    height: 21,
                    child: SvgIcon(
                      icon ?? '',
                      color: textColor ?? GawTheme.mainTint,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
