import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/src/utility/constants.dart';
import 'package:flutter_svg/svg.dart';

class MainLogoBig extends StatelessWidget {
  final BoxFit? fit;

  const MainLogoBig({super.key, this.fit});

  static const String assetName = 'assets/images/core/main-logo.svg';

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      package: kPackageName,
      fit: fit ?? BoxFit.fitHeight,
    );
  }
}
