import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class LeftTitle extends StatelessWidget {
  final String value;

  final TitleMeta meta;

  const LeftTitle({
    super.key,
    required this.value,
    required this.meta,
  });

  @override
  Widget build(BuildContext context) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 3,
      child: MainText(
        value,
      ),
    );
  }
}
