import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/text/auto_sized_text.dart';

class MainAppHeader extends StatelessWidget {
  final String? label;

  final bool showDate;

  final bool colorless;

  final Widget? trailing;

  final Function()? goBack;

  final double? height;

  final bool useBanner;

  const MainAppHeader({
    super.key,
    this.label,
    this.colorless = false,
    this.trailing,
    this.goBack,
    this.showDate = false,
    this.height,
    this.useBanner = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? (SizeUtil.isBigSize(context) ? 180 : 150),
      decoration: BoxDecoration(
        color: colorless ? null : GawTheme.secondaryTint,
      ),
      child: Stack(
        children: [
          useBanner
              ? const SvgImage(
                  'assets/images/banner/gaw_banner.svg',
                  fit: BoxFit.fitHeight,
                )
              : const SizedBox(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              label == null
                  ? const SizedBox.shrink()
                  : Expanded(
                      child: Padding(
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
                                : HeaderBackButton(
                                    color: colorless == true
                                        ? GawTheme.text
                                        : GawTheme.mainTintText,
                                    goBack: goBack,
                                  ),
                            AutoSizedText(
                              label!,
                              textStyleOverride: TextStyles.titleStyle.copyWith(
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                                color: colorless
                                    ? GawTheme.text
                                    : GawTheme.mainTintText,
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
                    ),
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
        ],
      ),
    );
  }
}
