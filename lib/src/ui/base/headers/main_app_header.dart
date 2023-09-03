import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class MainAppHeader extends StatelessWidget {
  final String? label;

  final Widget? trailing;

  const MainAppHeader({
    super.key,
    this.label,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      color: GawTheme.secondaryTint,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          label == null
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.only(
                    left: PaddingSizes.bigPadding,
                    bottom: PaddingSizes.mainPadding,
                  ),
                  child: MainText(
                    label!,
                    textStyleOverride: TextStyles.titleStyle.copyWith(
                      color: GawTheme.mainTintText,
                    ),
                  ),
                ),
          const Spacer(),
          trailing == null ? const SizedBox.shrink() : trailing!,
        ],
      ),
    );
  }
}
