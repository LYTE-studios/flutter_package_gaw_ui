import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class SettingsListTile extends StatelessWidget {
  final Widget? trailing;

  final String label;

  final Function()? onTap;

  final bool onlyTopRadius;

  final bool onlyBottomRadius;

  final Color color;

  const SettingsListTile(
      {super.key,
      required this.label,
      this.trailing,
      this.onTap,
      this.onlyTopRadius = false,
      this.onlyBottomRadius = false,
      this.color = GawTheme.clearBackground});

  final Radius radius = const Radius.circular(12);

  @override
  Widget build(BuildContext context) {
    BorderRadius borderRadius = BorderRadius.zero;

    if (onlyTopRadius) {
      borderRadius = BorderRadius.only(
        topLeft: radius,
        topRight: radius,
      );
    }

    if (onlyBottomRadius) {
      borderRadius = BorderRadius.only(
        bottomLeft: radius,
        bottomRight: radius,
      );
    }

    return InkWell(
      onTap: onTap,
      child: LayoutBuilder(builder: (context, constraints) {
        return Ink(
          height: 52,
          width: constraints.maxWidth,
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
            /*boxShadow: const [
                Shadows.mainShadow,
              ],*/
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(PaddingSizes.mainPadding),
                child: MainText(
                  label,
                  overflow: TextOverflow.fade,
                  textStyleOverride: TextStyles.mainStyleTitle.copyWith(
                    color: GawTheme.text,
                  ),
                ),
              ),
              const Spacer(),
              trailing ?? const SizedBox.shrink(),
            ],
          ),
        );
      }),
    );
  }
}
