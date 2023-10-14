import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class FormItemDivider extends StatelessWidget {
  final bool active;

  const FormItemDivider({
    super.key,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: double.infinity,
      constraints: const BoxConstraints(
        minWidth: 24,
        maxWidth: 210,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: PaddingSizes.mainPadding,
      ),
      decoration: BoxDecoration(
        color: !active ? GawTheme.unselectedMainTint : GawTheme.secondaryTint,
      ),
    );
  }
}
