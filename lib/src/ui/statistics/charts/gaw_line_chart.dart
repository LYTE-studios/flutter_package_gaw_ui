import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/statistics/titles/bottom_title.dart';
import 'package:gaw_ui/src/ui/statistics/titles/left_title.dart';

class GawLineChart extends StatelessWidget {
  final List<FlSpot> dataPoints;

  final bool weeklyView;

  GawLineChart({
    super.key,
    this.weeklyView = false,
    required this.dataPoints,
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

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int currentDayIndex = now.weekday - 1; // Considering 0 is Monday.

    double largest = !weeklyView ? 45 : 13;

    List<FlSpot> pastDataPoints = [];
    List<FlSpot> futureDataPoints = [];
    if (weeklyView) {
      for (var i = 0; i < dataPoints.length; i++) {
        if (i <= currentDayIndex) {
          final spot = dataPoints[i];
          pastDataPoints.add(spot);
          if (spot.y > largest) {
            largest = spot.y;
          }
        } else {
          futureDataPoints.add(dataPoints[i]);
        }
      }
    } else {
      for (var i = 0; i < dataPoints.length; i++) {
        if (i <= now.month) {
          final spot = dataPoints[i];
          pastDataPoints.add(spot);
          if (spot.y > largest) {
            largest = spot.y;
          }
        } else {
          futureDataPoints.add(dataPoints[i]);
        }
      }
    }
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          drawHorizontalLine: true,
          horizontalInterval: !weeklyView ? 10.0 : 4.0,
        ),
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
              tooltipBgColor: GawTheme.mainTint,
              getTooltipItems: (List<LineBarSpot> spots) {
                List<LineTooltipItem> items = [];

                for (LineBarSpot spot in spots) {
                  items.add(
                    LineTooltipItem(
                      spot.y.round().toString(),
                      TextStyles.mainStyle.copyWith(
                        color: GawTheme.mainTintText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }

                return items;
              }),
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
        maxY: largest,
        lineBarsData: [
          LineChartBarData(
            spots: pastDataPoints,
            isCurved: false,
            color: GawTheme.mainTint,
            barWidth: 4,
            isStrokeCapRound: false,
            dotData: FlDotData(
              show: true,
              getDotPainter: (p0, p1, p2, p3) => FlDotCirclePainter(
                radius: 2,
                color: GawTheme.clearBackground,
                strokeWidth: 0,
                strokeColor: GawTheme.mainTint,
              ),
            ),
            belowBarData: BarAreaData(show: false),
          ),
          LineChartBarData(
            spots: futureDataPoints,
            isCurved: false,
            color: GawTheme.secondaryTint,
            barWidth: 4,
            isStrokeCapRound: false,
            dotData: FlDotData(
              show: true,
              getDotPainter: (p0, p1, p2, p3) => FlDotCirclePainter(
                radius: 0.5,
                color: GawTheme.clearBackground,
                strokeWidth: 0,
                strokeColor: GawTheme.mainTint,
              ),
            ),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}
