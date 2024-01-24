import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class StatisticsChartContainer extends StatefulWidget {
  final List<FlSpot> weeklyStatistics;
  final int averageHours;
  final bool isTrend;
  final int trend;
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

  @override
  // ignore: library_private_types_in_public_api
  _StatisticsChartContainerState createState() =>
      _StatisticsChartContainerState();
}

class _StatisticsChartContainerState extends State<StatisticsChartContainer> {
  bool isBarChart = true; // State to toggle between chart types

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
                  trendHours: widget.trend.abs(),
                  isPositiveTrend: widget.trend >= 0 ? true : false,
                ),
                !isBarChart ? buildBarChartButton() : buildLineChartButton(),
              ],
            ),
            const SizedBox(height: PaddingSizes.smallPadding),
            Expanded(
              child: isBarChart
                  ? buildBarChart(widget.weeklyStatistics)
                  : buildLineChart(widget.weeklyStatistics),
            ),
            const SizedBox(height: PaddingSizes.bigPadding),
            const Legend(
              items: [
                LegendItem(
                  color: GawTheme.mainTint,
                  text: 'Completed jobs',
                ),
                SizedBox(width: PaddingSizes.extraBigPadding),
                // Adjust the space as needed
                LegendItem(
                  color: GawTheme.secondaryTint,
                  text: 'Scheduled jobs',
                ),
              ],
            ),
            const SizedBox(height: PaddingSizes.bigPadding),
          ],
        ),
      ),
    );
  }

  Widget buildBarChartButton() {
    return CircleAvatar(
      backgroundColor: GawTheme.secondaryTint,
      radius: 20, // Adjust the size to your needs
      child: InkWell(
        onTap: () {
          setState(() {
            isBarChart = !isBarChart;
          });
        },
        child: const SvgIcon(
          PixelPerfectIcons.barChart,
          color: GawTheme.clearBackground,
        ),
      ),
    );
  }

  Widget buildLineChartButton() {
    return CircleAvatar(
      backgroundColor: GawTheme.secondaryTint,
      radius: 20, // Adjust the size to your needs
      child: InkWell(
        onTap: () {
          setState(() {
            isBarChart = !isBarChart;
          });
        },
        child: const SvgIcon(
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
    DateTime now = DateTime.now();
    if (!widget.showWeekly) {
      for (var i = 0; i < weeklyDataPoints.length; i++) {
        final spot = weeklyDataPoints[i];
        Color barColor;
        if (i < now.weekday) {
          barColor = GawTheme.mainTint;
        } else {
          barColor = GawTheme.secondaryTint;
        }
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
    } else {
      for (var i = 0; i < weeklyDataPoints.length; i++) {
        final spot = weeklyDataPoints[i];
        Color barColor;
        if (i <= now.month) {
          barColor = GawTheme.mainTint;
        } else {
          barColor = GawTheme.secondaryTint;
        }
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
    }

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: widget.showWeekly ? 41 : 13,
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
              reservedSize: 20, // Reserve space for titles
              getTitlesWidget:
                  widget.showWeekly ? bottomTitlesMonths : bottomTitles,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 24,
              interval: 1,
              getTitlesWidget:
                  widget.showWeekly ? leftMonthlyTitles : leftTitles,
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
            horizontalInterval: widget.showWeekly ? 10.0 : 4.0),
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
    DateTime now = DateTime.now();
    int currentDayIndex = now.weekday - 1; // Considering 0 is Monday.

    List<FlSpot> pastDataPoints = [];
    List<FlSpot> futureDataPoints = [];
    if (!widget.showWeekly) {
      for (var i = 0; i < dataPoints.length; i++) {
        if (i <= currentDayIndex) {
          pastDataPoints.add(dataPoints[i]);
          if (i == currentDayIndex) {
            futureDataPoints.add(dataPoints[i]);
          }
        } else {
          futureDataPoints.add(dataPoints[i]);
        }
      }
    } else {
      for (var i = 0; i < dataPoints.length; i++) {
        if (i <= now.month) {
          pastDataPoints.add(dataPoints[i]);
          if (i == now.month) {
            futureDataPoints.add(dataPoints[i]);
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
            horizontalInterval: widget.showWeekly ? 10.0 : 4.0),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 20, // Reserve space for titles
              getTitlesWidget:
                  widget.showWeekly ? bottomTitlesMonths : bottomTitles,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              interval: 1,
              getTitlesWidget:
                  widget.showWeekly ? leftMonthlyTitles : leftTitles,
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
        maxY: widget.showWeekly ? 41 : 13,
        lineBarsData: [
          // Replace these placeholders with your actual data
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
                color: Colors.white,
                strokeWidth: 0,
                strokeColor: Colors.blue,
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
                radius: 2,
                color: Colors.white,
                strokeWidth: 0,
                strokeColor: Colors.blue,
              ),
            ),
            belowBarData: BarAreaData(show: false),
          ),
        ],
      ),
    );
  }
}

Widget bottomTitles(double value, TitleMeta meta) {
  final titles = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  Widget text = Text(
    titles[value.toInt()],
    style: const TextStyle(
      color: GawTheme.text,
      fontWeight: FontWeight.normal,
      fontSize: 10,
    ),
    textAlign: TextAlign.center,
  );
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 8.0,
    // rom the chart bar
    child: text,
  );
}

Widget bottomTitlesMonths(double value, TitleMeta meta) {
  final titles = [
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
    "Nov",
    "Dec"
  ];
  Widget text = Text(
    titles[value.toInt()],
    style: const TextStyle(
      color: GawTheme.text,
      fontWeight: FontWeight.normal,
      fontSize: 10,
    ),
    textAlign: TextAlign.center,
  );
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 8.0, // Space from the chart bar
    child: text,
  );
}

Widget leftTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: GawTheme.text,
    fontWeight: FontWeight.normal,
    fontSize: 10,
  );
  String text;
  if (value == 4) {
    text = '4h';
  } else if (value == 8) {
    text = '8h';
  } else if (value == 12) {
    text = '12h';
  } else {
    return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 3,
    child: Text(text, style: style),
  );
}

Widget leftMonthlyTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: GawTheme.text,
    fontWeight: FontWeight.normal,
    fontSize: 10,
  );
  String text;
  if (value == 10) {
    text = '10h';
  } else if (value == 20) {
    text = '20h';
  } else if (value == 30) {
    text = '30h';
  } else if (value == 40) {
    text = '40h';
  } else {
    return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 3,
    child: Text(text, style: style),
  );
}

class StatisticsSummaryWidget extends StatelessWidget {
  final int averageHours;
  final int trendHours;
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
          Row(
            children: [
              const Text(
                'On average',
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
          // Add more Text widgets for other summary data as needed
        ],
      ),
    );
  }
}
