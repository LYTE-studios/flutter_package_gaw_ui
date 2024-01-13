import 'package:flutter/material.dart';
import 'package:gaw_ui/src/ui/base/text/styles.dart';

class MainText extends StatelessWidget {
  final String text;

  final Color? color;

  final double? fontSize;

  final TextStyle? textStyleOverride;

  final TextOverflow? overflow;

  final TextAlign? alignment;

  final bool softWrap;

  final FontWeight? fontWeight;

  const MainText(
    this.text, {
    super.key,
    this.color,
    this.textStyleOverride,
    this.overflow,
    this.alignment,
    this.fontSize,
    this.fontWeight,
    this.softWrap = true,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
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
    );
  }
}
