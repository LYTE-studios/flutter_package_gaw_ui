import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class StatisticsChartContainer extends StatefulWidget {
  final List<FlSpot> weeklyStatistics;
  final int averageHours;
  final bool isTrend;
  final int? trend;
  final bool showWeekly;

  final EdgeInsets? overriddenPadding;

  const StatisticsChartContainer({
    Key? key,
    required this.weeklyStatistics,
    required this.averageHours,
    required this.isTrend,
    required this.trend,
    required this.showWeekly,
    this.overriddenPadding,
  }) : super(key: key);

  static double largestValue(List<FlSpot> values, double minimum) {
    double largest = 0;

    for (FlSpot spot in values) {
      if (spot.y > largest) {
        largest = spot.y;
      }
    }

    if (minimum > largest) {
      return minimum;
    }

    return largest + 3;
  }

  @override
  // ignore: library_private_types_in_public_api
  _StatisticsChartContainerState createState() =>
      _StatisticsChartContainerState();
}

class _StatisticsChartContainerState extends State<StatisticsChartContainer> {
  bool isBarChart = true; // State to toggle between chart types

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: GawTheme.clearBackground,
          borderRadius: BorderRadius.circular(18),
          border: const Border.fromBorderSide(
            Borders.mainSide,
          ),
          boxShadow: const [
            Shadows.mainShadow,
          ],
        ),
        margin: widget.overriddenPadding ?? const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatisticsSummaryWidget(
                    averageHours: widget.averageHours,
                    trendHours: widget.trend?.abs(),
                    isPositiveTrend: (widget.trend ?? 0) >= 0 ? true : false,
                  ),
                  // !isBarChart ? buildBarChartButton() : buildLineChartButton(),
                ],
              ),
              const SizedBox(height: PaddingSizes.smallPadding),
              Expanded(
                child: isBarChart
                    ? buildBarChart(widget.weeklyStatistics)
                    : buildLineChart(widget.weeklyStatistics),
              ),
              const SizedBox(height: PaddingSizes.bigPadding),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBarChartButton() {
    return ColorlessInkWell(
      onTap: () {
        setState(() {
          isBarChart = !isBarChart;
        });
      },
      child: const CircleAvatar(
        backgroundColor: GawTheme.secondaryTint,
        radius: 20,
        child: SvgIcon(
          PixelPerfectIcons.barChart,
          color: GawTheme.clearBackground,
        ),
      ),
    );
  }

  Widget buildLineChartButton() {
    return ColorlessInkWell(
      onTap: () {
        setState(() {
          isBarChart = !isBarChart;
        });
      },
      child: const CircleAvatar(
        backgroundColor: GawTheme.secondaryTint,
        radius: 20,
        child: SvgIcon(
          PixelPerfectIcons.lineChart,
          color: GawTheme.clearBackground,
        ),
      ),
    );
  }

  Widget buildAspectBarChart(List<FlSpot> weeklyDataPoints) {
    return AspectRatio(
      aspectRatio: 1,
      child: buildBarChart(weeklyDataPoints),
    );
  }

  Widget buildBarChart(List<FlSpot> weeklyDataPoints) {
    final barGroups = <BarChartGroupData>[];

    double interval = getInterval(weeklyDataPoints.length);

    double total = 0;

    List<FlSpot> spots = [];

    for (var i = 0; i < weeklyDataPoints.length; i++) {
      final spot = weeklyDataPoints[i];

      total += spot.y;

      if (i % interval.round() == 0 || i == weeklyDataPoints.length - 1) {
        spots.add(
          FlSpot(spot.x.roundToDouble(), total),
        );
        barGroups.add(
          BarChartGroupData(
            x: spot.x.round(),
            barRods: [
              BarChartRodData(
                toY: total,
                color: GawTheme.mainTint,
                width: 10,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              ),
            ],
          ),
        );
        total = 0;
      }
    }

    return BarChart(
      BarChartData(
        maxY: StatisticsChartContainer.largestValue(
          spots,
          24,
        ),
        alignment: BarChartAlignment.spaceAround,
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: GawTheme.mainTint,
            getTooltipItem: (a, b, c, d) => null,
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: getInterval(widget.weeklyStatistics.length),
              reservedSize: 32, // Reserve space for titles
              getTitlesWidget: (double value, TitleMeta meta) =>
                  bottomTitles(value, meta, widget.weeklyStatistics),
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 48,
              interval: getYInterval(spots),
              getTitlesWidget: (double value, TitleMeta meta) =>
                  leftTitles(value, meta, widget.weeklyStatistics),
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
          verticalInterval: getYInterval(spots),
          drawVerticalLine: false,
          drawHorizontalLine: true,
        ),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
            left: BorderSide(
              color: Colors.white,
              width: 0,
            ),
            right: BorderSide(
              color: Colors.white,
              width: 0,
            ),
            top: BorderSide(
              color: Colors.white,
              width: 0,
            ),
          ),
        ),
        barGroups: barGroups,
      ),
    );
  }

  Widget buildLineChart(List<FlSpot> dataPoints) {
    return LineChart(
      LineChartData(
        maxY: StatisticsChartContainer.largestValue(
          widget.weeklyStatistics,
          24,
        ),
        gridData: const FlGridData(
          show: true,
          drawVerticalLine: false,
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: getInterval(widget.weeklyStatistics.length),
              reservedSize: 20,
              // getTitlesWidget: (double value, TitleMeta meta) =>
              //     bottomTitles(value, meta, widget.weeklyStatistics),
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              interval: StatisticsChartContainer.largestValue(
                      widget.weeklyStatistics, 30) /
                  5,
              getTitlesWidget: (double value, TitleMeta meta) =>
                  leftTitles(value, meta, widget.weeklyStatistics),
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
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: widget.weeklyStatistics,
            isCurved: false,
            color: GawTheme.mainTint,
            barWidth: 4,
            isStrokeCapRound: false,
            dotData: FlDotData(
              show: true,
              getDotPainter: (p0, p1, p2, p3) => FlDotCirclePainter(
                radius: 2,
                color: GawTheme.clearText,
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

double getYInterval(List<FlSpot> spots) {
  return StatisticsChartContainer.largestValue(spots, 30) / 5;
}

double getInterval(int length) {
  const int interval = 32;

  if (length < interval) {
    return 1;
  }

  return length / interval;
}

Widget bottomTitles(double value, TitleMeta meta, List<FlSpot> spots) {
  int index = spots.indexOf(
      spots.firstWhere((element) => element.x.round() == value.toInt()));

  if (index % meta.appliedInterval.round() != 0 && index != spots.length - 1) {
    return const SizedBox();
  }

  Widget text = Padding(
    padding: const EdgeInsets.only(
      right: PaddingSizes.mainPadding,
    ),
    child: RotationTransition(
      turns: const AlwaysStoppedAnimation(-45 / 360),
      child: MainText(
        GawDateUtil.formatDate(
          GawDateUtil.fromApi(
            value.round(),
          ),
        ),
        textStyleOverride: TextStyles.mainStyle.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    ),
  );
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 8.0,
    // rom the chart bar
    child: text,
  );
}

Widget leftTitles(double value, TitleMeta meta, List<FlSpot> spots) {
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 3,
    child: MainText(
      '${value.round()}h',
      textStyleOverride: TextStyles.mainStyle.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

class StatisticsSummaryWidget extends StatelessWidget {
  final int averageHours;
  final int? trendHours;
  final bool isPositiveTrend;

  const StatisticsSummaryWidget({
    Key? key,
    required this.averageHours,
    required this.trendHours,
    required this.isPositiveTrend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final trendIcon =
        isPositiveTrend ? Icons.arrow_drop_up : Icons.arrow_drop_down;
    final trendColor = isPositiveTrend ? Colors.green : Colors.red;

    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: GawTheme.clearBackground,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${averageHours}h',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
          Visibility(
            visible: trendHours != null,
            child: Row(
              children: [
                const Text(
                  'Total ',
                  style: TextStyle(
                    color: GawTheme.text,
                    fontSize: 12,
                  ),
                ),
                Icon(
                  trendIcon,
                  color: trendColor,
                ),
                Text(
                  '${trendHours}h',
                  style: TextStyle(
                    color: trendColor,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          // Add more Text widgets for other summary data as needed
        ],
      ),
    );
  }
}
