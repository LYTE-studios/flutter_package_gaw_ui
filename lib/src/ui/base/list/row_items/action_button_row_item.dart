import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ActionButtonRowItem extends StatelessWidget {
  final String label;

  final Function()? onTap;

  final Alignment alignment;

  const ActionButtonRowItem({
    super.key,
    required this.label,
    this.onTap,
    this.alignment = Alignment.centerRight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        PaddingSizes.mainPadding,
      ),
      child: BaseRowItem(
        alignment: alignment,
        child: Center(
          child: ColorlessInkWell(
            onTap: onTap,
            child: SizedBox(
              height: double.infinity,
              width: 178,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: GawTheme.clearText,
                  border: const Border.fromBorderSide(Borders.mainSide),
                ),
                child: Center(
                  child: MainText(
                    label,
                    textStyleOverride: TextStyles.mainStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
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
