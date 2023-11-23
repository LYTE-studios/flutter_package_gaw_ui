import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class ListTapIcon extends StatelessWidget {
  const ListTapIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
      width: 16,
      child: SvgIcon(
        PixelPerfectIcons.eyeMedium,
        color: GawTheme.text,
      ),
    );
  }
}
