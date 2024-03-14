import 'package:flutter/material.dart';
import 'package:gaw_ui/src/ui/base/text/styles.dart';

class AutoSizedText extends StatelessWidget {
  final String text;

  final Color? color;

  final double minSize;

  final double maxSize;

  final double? maxHeight;

  final double defaultSize;

  final TextStyle? textStyleOverride;

  final TextOverflow? overflow;

  final TextAlign? alignment;

  final FontWeight? fontWeight;

  final bool softWrap;

  const AutoSizedText(
    this.text, {
    super.key,
    this.color,
    this.textStyleOverride,
    this.overflow,
    this.alignment,
    this.minSize = 56,
    this.maxSize = 256,
    this.maxHeight,
    this.defaultSize = 128,
    this.fontWeight,
    this.softWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minSize,
        maxWidth: maxSize,
        maxHeight: maxHeight ?? double.infinity,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          softWrap: softWrap,
          textAlign: alignment,
          overflow: overflow ?? TextOverflow.clip,
          style: textStyleOverride ??
              TextStyles.mainStyle.copyWith(
                color: color,
                fontWeight: fontWeight,
              ),
        ),
      ),
    );
  }
}
