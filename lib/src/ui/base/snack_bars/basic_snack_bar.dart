import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class BasicSnackBar extends StatelessWidget {
  final String? title;

  final String? description;

  const BasicSnackBar({
    super.key,
    this.title,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: GawTheme.clearBackground,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainText(
            title ?? '',
            textStyleOverride: TextStyles.mainStyleTitle,
          ),
          MainText(
            description ?? '',
            textStyleOverride: TextStyles.mainStyle.copyWith(
              color: GawTheme.unselectedText,
            ),
          )
        ],
      ),
    );
  }
}
