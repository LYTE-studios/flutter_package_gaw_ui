import 'package:flutter/material.dart';
import 'package:gaw_ui/src/ui/base/text/styles.dart';

class AutoSizedText extends StatelessWidget {
  final String text;

  final Color? color;

  final double minSize;

  final double maxSize;

  final double defaultSize;

  final TextStyle? textStyleOverride;

  final TextOverflow? overflow;

  final TextAlign? alignment;

  final FontWeight? fontWeight;

  const AutoSizedText(
    this.text, {
    super.key,
    this.color,
    this.textStyleOverride,
    this.overflow,
    this.alignment,
    this.minSize = 56,
    this.maxSize = 256,
    this.defaultSize = 128,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minSize,
        maxWidth: maxSize,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          softWrap: false,
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
