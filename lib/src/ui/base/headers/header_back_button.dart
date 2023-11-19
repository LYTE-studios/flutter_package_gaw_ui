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
      child: Padding(
        padding: const EdgeInsets.only(
          top: PaddingSizes.bigPadding,
          bottom: PaddingSizes.smallPadding,
        ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
