import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class InputTitleText extends StatelessWidget {
  final String text;

  final Color? color;

  final double? fontSize;

  final TextStyle? textStyleOverride;

  final TextOverflow? overflow;

  final TextAlign? alignment;

  final bool softWrap;

  final FontWeight? fontWeight;

  const InputTitleText(
    this.text, {
    super.key,
    this.color,
    this.textStyleOverride,
    this.overflow,
    this.alignment,
    this.fontSize = 14.126,
    this.fontWeight = FontWeight.w600,
    this.softWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: PaddingSizes.smallPadding),
      child: Text(
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
    );
  }
}
