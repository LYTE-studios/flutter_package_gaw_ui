import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class IconRowItem extends StatelessWidget {
  final String icon;

  final String? secondIcon;

  final Function()? onTap;

  final Function()? onTapSecond;

  const IconRowItem({
    super.key,
    required this.icon,
    this.secondIcon,
    this.onTap,
    this.onTapSecond,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        BaseRowItem(
          child: SizedBox(
            height: 24,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ColorlessInkWell(
                  onTap: () {
                    onTap?.call();
                  },
                  child: SvgIcon(
                    icon,
                    color: GawTheme.unselectedText,
                  ),
                ),
                Visibility(
                  visible: secondIcon != null,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: PaddingSizes.mainPadding,
                      ),
                      ColorlessInkWell(
                        onTap: () {
                          onTapSecond?.call();
                        },
                        child: SvgIcon(
                          secondIcon ?? '',
                          color: GawTheme.unselectedText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
