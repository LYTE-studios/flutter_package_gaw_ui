import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/loading/loading_spinner.dart';

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
          borderRadius: BorderRadius.circular(5),
          border: !outline
              ? null
              : const Border.fromBorderSide(
                  Borders.mainSide,
                ),
          boxShadow: const [
            Shadows.mainShadow,
          ],
        ),
        padding: padding,
        alignment: Alignment.center,
        child: Center(
          child: loading
              ? const LoadingSpinner(
                  color: GawTheme.clearBackground,
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                  ],
                ),
        ),
      ),
    );
  }
}
