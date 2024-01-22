import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class BaseOverviewBlock extends StatelessWidget {
  final Widget child;

  const BaseOverviewBlock({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: GawTheme.clearBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          Shadows.mainShadow,
        ],
      ),
      child: child,
    );
  }
}
