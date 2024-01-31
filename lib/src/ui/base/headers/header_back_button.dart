import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class HeaderBackButton extends StatelessWidget {
  final Color? color;

  final Function()? goBack;

  final double? widthOverride;

  final double? heightOverride;

  final double? size;

  const HeaderBackButton({
    super.key,
    this.goBack,
    this.color,
    this.widthOverride,
    this.heightOverride,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ColorlessInkWell(
      onTap: goBack,
      child: SizedBox(
        height: heightOverride ?? 78,
        width: widthOverride ?? 250,
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Row(
                children: [
                  SvgIcon(
                    PixelPerfectIcons.arrowBack,
                    color: color == GawTheme.text
                        ? GawTheme.secondaryTint
                        : GawTheme.mainTintText,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: PaddingSizes.smallPadding,
                    ),
                    child: MainText(
                      LocaleKeys.back.tr(),
                      color: color ?? GawTheme.mainTintText,
                      textStyleOverride: TextStyles.titleStyle.copyWith(
                        color: color ?? GawTheme.mainTintText,
                        fontSize: size ?? 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            heightOverride != null
                ? const SizedBox()
                : const SizedBox(
                    height: PaddingSizes.bigPadding,
                  ),
          ],
        ),
      ),
    );
  }
}
