import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/ui/base/headers/header_back_button.dart';
import 'package:flutter_package_gaw_ui/src/utility/constants.dart';

class LoginAppHeader extends StatelessWidget {
  final String label;

  final Function()? onGoBack;

  const LoginAppHeader({
    super.key,
    required this.label,
    this.onGoBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: GawTheme.secondaryTint,
        image: DecorationImage(
          image: AssetImage(
            'assets/images/core/login_banner.png',
            package: kPackageName,
          ),
          fit: BoxFit.cover,
          opacity: 0.13,
        ),
      ),
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
    );
  }
}
