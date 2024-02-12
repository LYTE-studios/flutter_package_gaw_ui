import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/text/auto_sized_text.dart';

class BaseStateBlock extends StatelessWidget {
  final Color color;

  final Color? textColor;

  final String label;

  final String? iconName;

  final bool isLeadingIcon;

  final bool hasBorder;

  const BaseStateBlock({
    super.key,
    required this.color,
    this.textColor,
    required this.label,
    this.iconName,
    this.isLeadingIcon = false,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 136,
      constraints: const BoxConstraints(
        minWidth: 92,
      ),
      height: 32,
      decoration: BoxDecoration(
        color: color,
        border: hasBorder == false
            ? null
            : Border.all(
                color: GawTheme.unselectedText,
              ),
        borderRadius: BorderRadius.circular(
          16,
        ),
      ),
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingSizes.extraSmallPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isLeadingIcon == false
                  ? const SizedBox()
                  : iconName == null
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.all(
                            PaddingSizes.extraMiniPadding,
                          ),
                          child: SvgIcon(
                            iconName!,
                            color: textColor ?? GawTheme.mainTintText,
                          ),
                        ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PaddingSizes.extraSmallPadding,
                ),
                child: AutoSizedText(
                  label,
                  maxSize: 64,
                  textStyleOverride: TextStyles.mainStyle.copyWith(
                    color: textColor ?? GawTheme.mainTintText,
                    fontSize: 14,
                  ),
                ),
              ),
              isLeadingIcon == true
                  ? const SizedBox()
                  : iconName == null
                      ? const SizedBox.shrink()
                      : Row(
                          children: [
                            const SizedBox(
                              width: PaddingSizes.extraMiniPadding,
                            ),
                            SvgIcon(
                              iconName!,
                              color: textColor ?? GawTheme.mainTintText,
                            ),
                          ],
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
