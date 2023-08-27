import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/src/ui/base/text/styles.dart';

class MainText extends StatelessWidget {
  final String text;

  final Color? color;

  final TextStyle? textStyleOverride;

  const MainText(
    this.text, {
    super.key,
    this.color,
    this.textStyleOverride,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyleOverride ??
          TextStyles.mainStyle.copyWith(
            color: color,
          ),
    );
  }
}
