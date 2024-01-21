import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class PopupTitleText extends StatelessWidget {
  final String text;

  final Color? color;

  final double? fontSize;

  final TextStyle? textStyleOverride;

  final TextOverflow? overflow;

  final TextAlign? alignment;

  final bool softWrap;

  final FontWeight? fontWeight;

  final double paddingBottom;

  final Widget? icon;

  const PopupTitleText(
    this.text, {
    super.key,
    this.color,
    this.textStyleOverride,
    this.overflow,
    this.alignment,
    this.fontSize = 26,
    this.fontWeight = FontWeight.w500,
    this.paddingBottom = 66,
    this.softWrap = true,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Widget iconPart = Container();

    if (icon != null) {
      iconPart = Row(
        children: [
          icon!,
          const SizedBox(width: PaddingSizes.smallPadding),
        ],
      );
    }

    return Padding(
      padding: EdgeInsets.only(bottom: paddingBottom),
      child: Row(
        children: [
          iconPart,
          Text(
            text,
            softWrap: softWrap,
            textAlign: alignment,
            overflow: overflow ?? TextOverflow.clip,
            style: textStyleOverride ??
                TextStyles.mainStyle.copyWith(
                  color: color,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                ),
          ),
        ],
      ),
    );
  }
}
