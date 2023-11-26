import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/utility/constants.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String assetName;

  final Color? color;

  final BoxFit? fit;

  const SvgIcon(
    this.assetName, {
    super.key,
    this.color,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      package: kPackageName,
      fit: fit ?? BoxFit.contain,
      colorFilter: ColorFilter.mode(
        color ?? GawTheme.mainTint,
        BlendMode.srcIn,
      ),
    );
  }
}
