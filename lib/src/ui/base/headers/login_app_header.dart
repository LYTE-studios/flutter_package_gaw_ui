import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/utility/constants.dart';

class LoginAppHeader extends StatelessWidget {
  final String label;

  const LoginAppHeader({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/core/login_banner.png',
            package: kPackageName,
            fit: BoxFit.cover,
            color: GawTheme.secondaryTint,
            colorBlendMode: BlendMode.darken,
          ),
          Positioned(
            bottom: PaddingSizes.mainPadding,
            left: PaddingSizes.bigPadding,
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
    );
  }
}
