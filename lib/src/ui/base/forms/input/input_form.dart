import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class InputForm extends StatelessWidget {
  final String? label;

  final Widget child;

  const InputForm({
    super.key,
    this.label,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Visibility(
          visible: label != null,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: PaddingSizes.extraSmallPadding,
            ),
            child: MainText(
              label ?? '',
              textStyleOverride: TextStyles.titleStyle.copyWith(
                fontSize: 14,
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
