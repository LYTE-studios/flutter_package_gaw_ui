import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, // Use min to wrap content
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 10, // Width of the color box
          height: 10, // Height of the color box
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
            shape: BoxShape.rectangle, // Use circle for round indicator
          ),
        ),
        const SizedBox(height: PaddingSizes.smallPadding),
        // Spacing between color box and text
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: GawTheme.text,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
