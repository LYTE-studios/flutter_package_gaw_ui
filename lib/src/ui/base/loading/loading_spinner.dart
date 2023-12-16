import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class LoadingSpinner extends StatelessWidget {
  final Color? color;

  const LoadingSpinner({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 16,
        width: 16,
        child: CircularProgressIndicator(
          color: color ?? GawTheme.secondaryTint,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
