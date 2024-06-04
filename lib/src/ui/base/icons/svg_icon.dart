import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/utility/constants.dart';

class SvgIcon extends StatelessWidget {
  final String assetName;

  final Color? color;

  final BoxFit? fit;

  final bool useRootPackage;

  final bool useRawColors;

  const SvgIcon(
    this.assetName, {
    super.key,
    this.color,
    this.fit,
    this.useRootPackage = false,
        this.useRawColors = false,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      package: useRootPackage ? null : kPackageName,
      fit: fit ?? BoxFit.contain,
      colorFilter: useRawColors ? null: ColorFilter.mode(
        color ?? GawTheme.mainTint,
        BlendMode.srcIn,
      ),
    );
  }
}
