import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class IncrementDescription extends StatelessWidget {
  final double increment;

  const IncrementDescription({
    super.key,
    required this.increment,
  });

  @override
  Widget build(BuildContext context) {
    bool isNegative = increment < 0;

    String operator = isNegative ? '-' : '+';

    return MainText(
      '$operator$increment%',
      color: isNegative ? GawTheme.error : GawTheme.success,
    );
  }
}
