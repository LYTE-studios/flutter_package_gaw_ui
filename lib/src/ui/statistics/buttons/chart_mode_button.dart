import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ChartModeButton extends StatelessWidget {
  final VoidCallback? onTap;

  final bool isLine;

  const ChartModeButton({
    super.key,
    this.onTap,
    this.isLine = false,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: GawTheme.secondaryTint,
      radius: 26, // Adjust the size to your needs
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 20,
          width: 20,
          child: SvgIcon(
            isLine ? PixelPerfectIcons.lineChart : PixelPerfectIcons.barChart,
            color: GawTheme.clearBackground,
          ),
        ),
      ),
    );
  }
}
