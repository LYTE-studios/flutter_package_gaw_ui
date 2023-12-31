import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/statistics/titles/bottom_title.dart';
import 'package:gaw_ui/src/ui/statistics/titles/left_title.dart';

class GawBarChart extends StatelessWidget {
  final List<FlSpot> dataPoints;

  final bool weeklyView;

  GawBarChart({
    super.key,
    required this.dataPoints,
    this.weeklyView = false,
  });

  late final List<double> titleValues = weeklyView
      ? [
          4,
          8,
          12,
        ]
      : [
          10,
          20,
          30,
          40,
        ];

  Color getBarColor(int index) {
    DateTime now = DateTime.now();
    if (index < (weeklyView ? now.weekday : now.month)) {
      return GawTheme.mainTint;
    }

    return GawTheme.secondaryTint;
  }

  @override
  Widget build(BuildContext context) {
    double largest = !weeklyView ? 45 : 13;

    final barGroups = <BarChartGroupData>[];
    for (var i = 0; i < dataPoints.length; i++) {
      final spot = dataPoints[i];
      if (spot.y > largest) {
        largest = spot.y;
      }
      Color barColor = getBarColor(i);
      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: spot.y,
              color: barColor,
              width: 10,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
            ),
          ],
          // additional styling if necessary
        ),
      );
    }

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceBetween,
        maxY: largest,
        barTouchData: BarTouchData(
          handleBuiltInTouches: true,
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: GawTheme.mainTint,
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            axisNameSize: 26,
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 26, // Reserve space for titles
              getTitlesWidget: (double value, TitleMeta meta) {
                if ((value % 2 == 1) && !weeklyView) {
                  return const SizedBox();
                }
                return BottomTitle(
                  index: value.toInt(),
                  meta: meta,
                  isWeekly: weeklyView,
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            axisNameSize: 24,
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 36,
              interval: 1,
              getTitlesWidget: (double value, TitleMeta meta) {
                int rounded = value.toInt();

                if (!titleValues.contains(rounded)) {
                  return const SizedBox();
                }

                return Padding(
                  padding: const EdgeInsets.only(
                    right: PaddingSizes.smallPadding,
                  ),
                  child: LeftTitle(
                    value: '${rounded.toString()}h',
                    meta: meta,
                  ),
                );
              },
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false, // Disable top titles
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false, // Disable right titles
            ),
          ),
        ),
        gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            drawHorizontalLine: true,
            horizontalInterval: !weeklyView ? 10.0 : 4.0,
            getDrawingHorizontalLine: (double value) {
              return HorizontalLine(
                y: value,
                color: GawTheme.unselectedText,
              );
            }),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(
              color: GawTheme.unselectedText,
              width: 0.4,
            ),
            left: BorderSide(
              color: Colors.transparent,
              width: 0.0,
            ),
            right: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
            top: BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
        ),
        barGroups: barGroups,
      ),
    );
  }
}
