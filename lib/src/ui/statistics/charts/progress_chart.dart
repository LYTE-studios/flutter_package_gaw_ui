import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ProgressChart extends StatefulWidget {
  final int value;

  final int maxValue;

  final Color? color;

  final double size;

  final bool isLoading;

  const ProgressChart({
    super.key,
    required this.value,
    required this.maxValue,
    this.color,
    this.size = 64,
    this.isLoading = false,
  });

  @override
  State<ProgressChart> createState() => _ProgressChartState();
}

class _ProgressChartState extends State<ProgressChart>
    with TickerProviderStateMixin {
  double get progressValue =>
      (widget.maxValue == 0 ? 0 : (widget.value / widget.maxValue));

  late final Animation<double> valueAnimation = Tween<double>(
    begin: 0,
    end: 1,
  ).animate(valueController);

  late final AnimationController valueController = AnimationController(
    vsync: this,
    reverseDuration: Duration.zero,
    duration: const Duration(
      milliseconds: 300,
    ),
    value: widget.isLoading ? null : progressValue,
  )..addListener(() {
      setState(() {});
    });

  void setAnimation() {
    if (widget.isLoading) {
      valueController.repeat(
        reverse: true,
      );
    } else {
      valueController.animateTo(progressValue);
    }
  }

  @override
  Widget build(BuildContext context) {
    setAnimation();
    return SizedBox(
      height: widget.size,
      width: widget.size,
      child: Stack(children: [
        Visibility(
          visible: !widget.isLoading,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MainText(
                  '${widget.value}',
                  textStyleOverride: TextStyles.mainStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                MainText(
                  '/${widget.maxValue}',
                  textStyleOverride: TextStyles.mainStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: CircularProgressIndicator(
            strokeWidth: 8,
            strokeCap: StrokeCap.round,
            value: valueAnimation.value,
            backgroundColor: GawTheme.unselectedBackground,
            valueColor: AlwaysStoppedAnimation<Color>(
              widget.color ?? GawTheme.mainTint,
            ),
          ),
        ),
      ]),
    );
  }
}
