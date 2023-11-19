import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class SmallCheckBox extends StatelessWidget {
  final bool value;

  const SmallCheckBox({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: value ? GawTheme.secondaryTint : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: value
            ? null
            : Border.all(
                width: 1,
                color: GawTheme.unselectedText,
              ),
      ),
      child: value
          ? const SvgIcon(
              PixelPerfectIcons.checkMedium,
              color: GawTheme.mainTintText,
            )
          : const SizedBox(),
    );
  }
}
