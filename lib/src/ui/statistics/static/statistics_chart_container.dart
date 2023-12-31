import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/statistics/buttons/chart_mode_button.dart';
import 'package:gaw_ui/src/ui/statistics/charts/gaw_bar_chart.dart';
import 'package:gaw_ui/src/ui/statistics/charts/gaw_line_chart.dart';
import 'package:gaw_ui/src/ui/statistics/static/statistics_legend.dart';
import 'package:gaw_ui/src/ui/statistics/static/statistics_summary_block.dart';

class StatisticsChartContainer extends StatefulWidget {
  final List<FlSpot> dataPoints;
  final int averageHours;
  final bool isTrend;
  final int trend;
  final bool showWeekly;
  final bool isLineChart;
  final VoidCallback? toggleChartMode;

  const StatisticsChartContainer({
    Key? key,
    required this.dataPoints,
    required this.averageHours,
    required this.isTrend,
    required this.trend,
    required this.showWeekly,
    this.isLineChart = false,
    this.toggleChartMode,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StatisticsChartContainerState createState() =>
      _StatisticsChartContainerState();
}

class _StatisticsChartContainerState extends State<StatisticsChartContainer> {
  late bool isBarChart =
      !widget.isLineChart; // State to toggle between chart types

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: GawTheme.clearBackground,
        borderRadius: BorderRadius.circular(18),
        border: const Border.fromBorderSide(
          Borders.mainSide,
        ),
        boxShadow: const [Shadows.mainShadow],
      ),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.only(
          top: PaddingSizes.smallPadding,
          left: PaddingSizes.bigPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatisticsSummaryBlock(
                  averageHours: widget.averageHours,
                  trendHours: widget.trend.abs(),
                  isPositiveTrend: widget.trend >= 0 ? true : false,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: PaddingSizes.bigPadding,
                  ),
                  child: ChartModeButton(
                    isLine: !isBarChart,
                    onTap: () {
                      setState(() {
                        isBarChart = !isBarChart;
                      });
                      widget.toggleChartMode?.call();
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: PaddingSizes.smallPadding,
            ),
            Expanded(
              child: isBarChart
                  ? GawBarChart(
                      dataPoints: widget.dataPoints,
                      weeklyView: widget.showWeekly,
                    )
                  : GawLineChart(
                      dataPoints: widget.dataPoints,
                      weeklyView: widget.showWeekly,
                    ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: PaddingSizes.mainPadding,
              ),
              child: StatisticsLegend(),
            ),
          ],
        ),
      ),
    );
  }
}
