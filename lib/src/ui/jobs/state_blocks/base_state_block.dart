import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

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
      constraints: const BoxConstraints(
        minWidth: 81,
        maxWidth: 136,
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
            horizontal: PaddingSizes.smallPadding,
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
                          padding: const EdgeInsets.only(
                            left: PaddingSizes.smallPadding,
                          ),
                          child: SvgIcon(
                            iconName!,
                            size: 16,
                            color: textColor ?? GawTheme.clearText,
                          ),
                        ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PaddingSizes.smallPadding,
                ),
                child: MainText(
                  label,
                  textStyleOverride: TextStyles.mainStyle.copyWith(
                    color: textColor ?? GawTheme.clearText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              isLeadingIcon == true
                  ? const SizedBox()
                  : iconName == null
                      ? const SizedBox.shrink()
                      : Padding(
                          padding: const EdgeInsets.only(
                            right: PaddingSizes.smallPadding,
                          ),
                          child: SvgIcon(
                            iconName!,
                            size: 16,
                            color: textColor ?? GawTheme.clearText,
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
