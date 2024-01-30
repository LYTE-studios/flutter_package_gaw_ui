import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ActionButton extends StatelessWidget {
  final Function()? onTap;

  final String label;

  final String? icon;

  final double? height;

  const ActionButton({
    super.key,
    this.onTap,
    this.icon,
    required this.label,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSizes.bigPadding,
        ),
        child: ColorlessInkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(PaddingSizes.mainPadding),
            child: Container(
              height: height ?? 32,
              constraints: const BoxConstraints(
                minWidth: 156,
              ),
              decoration: BoxDecoration(
                color: GawTheme.clearText,
                borderRadius: BorderRadius.circular(4),
                border: const Border.fromBorderSide(Borders.lightSide),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: PaddingSizes.smallPadding,
                  ),
                  child: icon == null
                      ? _TextItem(
                          label: label,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgIcon(
                              icon ?? '',
                              color: GawTheme.text,
                            ),
                            const SizedBox(
                              width: PaddingSizes.smallPadding,
                            ),
                            _TextItem(
                              label: label,
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TextItem extends StatelessWidget {
  final String label;

  const _TextItem({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return MainText(
      label,
      alignment: TextAlign.center,
      textStyleOverride: TextStyles.mainStyle.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
