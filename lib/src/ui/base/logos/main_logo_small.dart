import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/utility/constants.dart';

class MainLogoSmall extends StatelessWidget {
  final BoxFit? fit;

  const MainLogoSmall({super.key, this.fit});

  static const String assetName = 'assets/images/core/main_logo_small.svg';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: GawTheme.mainTint,
      child: Padding(
        padding: const EdgeInsets.all(
          PaddingSizes.smallPadding,
        ),
        child: SvgPicture.asset(
          assetName,
          package: kPackageName,
          fit: fit ?? BoxFit.fitHeight,
        ),
      ),
    );
  }
}
