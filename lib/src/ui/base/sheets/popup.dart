import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class PopupSheet extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final double maxHeight;
  final bool visible;

  const PopupSheet({
    super.key,
    this.visible = true,
    required this.child,
    required this.maxWidth,
    required this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return Container();
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: GawTheme.shadow,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: GawTheme.clearText,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: const EdgeInsets.all(38),
          constraints: BoxConstraints(
            maxWidth: maxWidth,
            maxHeight: maxHeight,
          ),
          child: child,
        ),
      ],
    );
  }
}
