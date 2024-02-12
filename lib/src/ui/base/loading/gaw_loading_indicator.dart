import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class GawLoadingIndicator extends StatelessWidget {
  final Color? color;

  const GawLoadingIndicator({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const SplashLogo(),
    );
  }
}
