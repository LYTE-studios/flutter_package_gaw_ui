import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class HeaderBackButton extends StatelessWidget {
  final Color? color;

  final Function()? goBack;

  const HeaderBackButton({
    super.key,
    this.goBack,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: goBack,
      child: SizedBox(
        height: 78,
        width: 250,
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Row(
                children: [
                  SvgIcon(
                    PixelPerfectIcons.leftArrowNormal,
                    color: color ?? GawTheme.mainTintText,
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
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: PaddingSizes.bigPadding,
            ),
          ],
        ),
      ),
    );
  }
}
