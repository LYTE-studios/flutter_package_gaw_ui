import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaw_ui/src/utility/constants.dart';

class SvgImage extends StatelessWidget {
  final String assetName;

  final BoxFit? fit;

  final double? height;

  final double? width;

  final Color? color;
  final bool rawPath;

  const SvgImage(
    this.assetName, {
    super.key,
    this.fit,
    this.width,
    this.height,
    this.color,
        this.rawPath = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        assetName,
        height: height,
        width: width,
        package: rawPath ? null: kPackageName,
        fit: fit ?? BoxFit.fitWidth,
        colorFilter:
            color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
      ),
    );
  }
}
