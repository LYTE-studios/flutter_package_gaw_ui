import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_api/flutter_package_gaw_api.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'base_chart.dart';

class WorkedHoursChart extends StatelessWidget {
  final List<WeightedDouble> chartData;

  const WorkedHoursChart({
    super.key,
    required this.chartData,
  });

  @override
  Widget build(BuildContext context) {
    return BaseChart();
  }
}
