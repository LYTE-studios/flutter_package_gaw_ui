import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/utility/constants.dart';

class LoginAppHeader extends StatelessWidget {
  final String label;

  final Function()? onGoBack;

  final double opacity;

  const LoginAppHeader({
    super.key,
    required this.label,
    this.onGoBack,
    this.opacity = 0.13,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeUtil.isBigSize(context) ? 290 : 210,
      width: double.infinity,
      decoration: BoxDecoration(
        color: GawTheme.secondaryTint,
        image: DecorationImage(
          image: const AssetImage(
            'assets/images/core/login_banner.png',
            package: kPackageName,
          ),
          fit: BoxFit.cover,
          opacity: opacity,
        ),
        boxShadow: opacity == 1
            ? [
                BoxShadow(
                  color: GawTheme.unselectedText.withOpacity(0.7),
                  offset: const Offset(0, 4),
                  blurRadius: 2,
                ),
              ]
            : null,
      ),
      child: SafeArea(
        top: true,
        bottom: false,
        child: Stack(
          children: [
            Positioned(
              bottom: PaddingSizes.mainPadding,
              left: PaddingSizes.bigPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  onGoBack == null
                      ? const SizedBox.shrink()
                      : HeaderBackButton(
                          color: GawTheme.mainTintText,
                          goBack: onGoBack,
                        ),
                  const SizedBox(
                    height: PaddingSizes.mainPadding,
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 240,
                    ),
                    child: MainText(
                      label,
                      textStyleOverride: TextStyles.titleStyle.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 30,
                        color: GawTheme.mainTintText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
