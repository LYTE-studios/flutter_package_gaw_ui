import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class WizardHeaderItem extends StatelessWidget {
  final String label;

  final String indexed;

  final bool active;

  const WizardHeaderItem({
    super.key,
    required this.label,
    required this.indexed,
    this.active = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FormNumberSelector(
          label: indexed,
          active: active,
        ),
        const SizedBox(
          width: PaddingSizes.extraSmallPadding,
        ),
        MainText(
          label,
          textStyleOverride: TextStyles.mainStyle.copyWith(
            color:
                active ? GawTheme.secondaryTint : GawTheme.unselectedMainTint,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
