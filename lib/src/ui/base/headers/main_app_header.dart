import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_api/flutter_package_gaw_api.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class MainAppHeader extends StatelessWidget {
  final String? label;

  final bool showDate;

  final bool colorless;

  final Widget? trailing;

  final Function()? goBack;

  const MainAppHeader({
    super.key,
    this.label,
    this.colorless = false,
    this.trailing,
    this.goBack,
    this.showDate = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      color: colorless ? null : GawTheme.secondaryTint,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          label == null
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(
                    left: PaddingSizes.bigPadding,
                    bottom: PaddingSizes.mainPadding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      goBack == null
                          ? const SizedBox.shrink()
                          : GestureDetector(
                              onTap: goBack,
                              child: Row(
                                children: [
                                  SvgIcon(
                                    PixelPerfectIcons.leftArrowNormal,
                                    color: colorless == true
                                        ? GawTheme.text
                                        : GawTheme.mainTintText,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: PaddingSizes.smallPadding,
                                    ),
                                    child: MainText(
                                      LocaleKeys.back.tr(),
                                      color: colorless == true
                                          ? GawTheme.text
                                          : GawTheme.mainTintText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      const SizedBox(
                        height: PaddingSizes.mainPadding,
                      ),
                      MainText(
                        label!,
                        textStyleOverride: TextStyles.titleStyle.copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 30,
                          color:
                              colorless ? GawTheme.text : GawTheme.mainTintText,
                        ),
                      ),
                      Visibility(
                        visible: showDate,
                        child: MainText(
                          GawDateUtil.formatReadableDate(
                            DateTime.now(),
                          ),
                          color: GawTheme.mainTintUnselectedText,
                        ),
                      ),
                    ],
                  ),
                ),
          const Spacer(),
          trailing == null
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: PaddingSizes.mainPadding,
                    vertical: PaddingSizes.mainPadding,
                  ),
                  child: IntrinsicHeight(
                    child: trailing!,
                  ),
                ),
        ],
      ),
    );
  }
}
