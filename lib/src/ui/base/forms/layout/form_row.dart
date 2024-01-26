import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class FormRow extends StatelessWidget {
  final List<Widget> formItems;

  final String? label;

  const FormRow({
    super.key,
    required this.formItems,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: Padding(
            padding: const EdgeInsets.only(
              top: PaddingSizes.bigPadding,
              bottom: PaddingSizes.extraSmallPadding,
            ),
            child: MainText(
              label ?? '',
              textStyleOverride: TextStyles.titleStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: formItems,
        ),
      ],
    );
  }
}
