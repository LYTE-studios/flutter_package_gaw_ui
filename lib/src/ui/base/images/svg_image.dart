import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/src/utility/constants.dart';
import 'package:flutter_svg/svg.dart';

class SvgImage extends StatelessWidget {
  final String assetName;

  final BoxFit? fit;

  const SvgImage(
    this.assetName, {
    super.key,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        assetName,
        package: kPackageName,
        fit: fit ?? BoxFit.fitWidth,
      ),
    );
  }
}
