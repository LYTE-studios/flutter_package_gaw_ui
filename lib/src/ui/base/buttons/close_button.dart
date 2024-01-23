import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class GawCloseButton extends StatelessWidget {
  final Function()? onClose;

  const GawCloseButton({
    super.key,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return ColorlessInkWell(
      onTap: onClose,
      child: const SizedBox(
        height: 24,
        width: 24,
        child: SvgIcon(
          PixelPerfectIcons.xNormal,
          color: GawTheme.text,
        ),
      ),
    );
  }
}
