import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/ui/base/loading/loading_spinner.dart';

class GenericButton extends StatelessWidget {
  final String? label;

  final Function()? onTap;

  final Color? color;

  final Color? textColor;

  final TextStyle? textStyleOverride;

  final bool loading;

  const GenericButton({
    super.key,
    this.label,
    this.onTap,
    this.color,
    this.textColor,
    this.textStyleOverride,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 120,
          minHeight: 40,
        ),
        decoration: BoxDecoration(
          color: color ?? GawTheme.mainTint,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            Shadows.mainShadow,
          ],
        ),
        alignment: Alignment.center,
        child: Center(
          child: loading
              ? const LoadingSpinner(
                  color: GawTheme.clearBackground,
                )
              : MainText(
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
