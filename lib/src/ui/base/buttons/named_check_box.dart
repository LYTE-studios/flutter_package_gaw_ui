import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class NamedCheckBox extends StatelessWidget {
  final Function()? onToggle;

  final bool value;

  final String label;

  const NamedCheckBox({
    super.key,
    this.onToggle,
    this.value = false,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ColorlessInkWell(
      onTap: onToggle,
      child: Row(
        children: [
          SmallCheckBox(
            onToggle: onToggle,
            value: value,
          ),
          const SizedBox(
            width: PaddingSizes.smallPadding,
          ),
          MainText(
            label,
          ),
        ],
      ),
    );
  }
}
