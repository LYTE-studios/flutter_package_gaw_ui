import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

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
        child: RepaintBoundary(
          child: CircularProgressIndicator(
            color: color ?? GawTheme.secondaryTint,
            strokeWidth: 2,
          ),
        ),
      ),
    );
  }
}
