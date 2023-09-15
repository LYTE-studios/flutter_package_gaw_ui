import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class MainAppHeader extends StatelessWidget {
  final String? label;

  final bool colorless;

  final Widget? trailing;

  final Function()? goBack;

  const MainAppHeader({
    super.key,
    this.label,
    this.colorless = false,
    this.trailing,
    this.goBack,
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
                          : InkWell(
                              onTap: goBack,
                              child: const Row(
                                children: [
                                  SvgIcon(
                                    PixelPerfectIcons.leftArrowNormal,
                                    color: GawTheme.mainTintText,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: PaddingSizes.smallPadding,
                                    ),
                                    child: MainText(
                                      'Back',
                                      color: GawTheme.mainTintText,
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
