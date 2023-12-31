import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class BottomTitle extends StatelessWidget {
  final int index;

  final TitleMeta meta;

  final bool isWeekly;

  const BottomTitle({
    super.key,
    required this.index,
    required this.meta,
    this.isWeekly = true,
  });

  @override
  Widget build(BuildContext context) {
    List<String> titles = isWeekly
        ? [
            'Mon',
            'Tue',
            'Wed',
            'Thu',
            'Fri',
            'Sat',
            'Sun',
          ]
        : [
            'Jan',
            'Feb',
            'Mar',
            'Apr',
            'May',
            'Jun',
            'Jul',
            'Aug',
            'Sep',
            'Oct',
            'Nov',
            'Dec',
          ];
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 8.0,
      child: MainText(
        titles[index],
        alignment: TextAlign.center,
      ),
    );
  }
}
