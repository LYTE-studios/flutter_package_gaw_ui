import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class RotatingIcon extends StatefulWidget {
  final String iconUrl;
  final double turns;
  final bool rotate; // New flag to control rotation
  final int rotation;
  final Color color;

  const RotatingIcon({
    Key? key,
    required this.iconUrl,
    this.color = GawTheme.text,
    this.turns = 0.25,
    this.rotate = false, // Default value is false
    this.rotation = 0,
  }) : super(key: key);

  @override
  State<RotatingIcon> createState() => _RotatingIconState();
}

class _RotatingIconState extends State<RotatingIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(RotatingIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.rotate != oldWidget.rotate) {
      widget.rotate ? _controller.forward() : _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        width: 16,
        height: 16,
        child: AnimatedRotation(
          turns: widget.rotate ? -widget.turns : 0,
          duration: const Duration(milliseconds: 200),
          child: RotatedBox(
              quarterTurns: widget.rotation,
              child: SvgIcon(
                widget.iconUrl,
                color: widget.color,
              )),
        ),
      ),
    );
  }
}
