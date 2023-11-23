import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class ListUtil {
  static const double sColumn = 86;

  static const double mColumn = 109;

  static const double lColumn = 136;

  static Widget makeRow(Map<Widget, double> data) {
    List<Widget> items = [];

    items.add(
      const SizedBox(
        width: PaddingSizes.mainPadding,
      ),
    );

    for (Widget widget in data.keys) {
      items.add(
        SizedBox(
          width: data[widget],
          child: widget,
        ),
      );
    }

    items.add(const Spacer());

    return Container(
      height: 48,
      decoration: const BoxDecoration(
        border: Border(
          bottom: Borders.lightSide,
        ),
      ),
      child: Row(
        children: items,
      ),
    );
  }

  static Widget makeHeader(Map<String, double> data) {
    List<Widget> items = [];

    items.add(
      const SizedBox(
        width: PaddingSizes.mainPadding,
      ),
    );

    for (String label in data.keys) {
      items.add(
        SizedBox(
          width: data[label],
          child: MainText(
            label,
            alignment: TextAlign.start,
          ),
        ),
      );
    }
    items.add(const Spacer());

    return Container(
      height: 56,
      decoration: const BoxDecoration(
        border: Border(
          bottom: Borders.mainSide,
        ),
      ),
      child: Row(
        children: items,
      ),
    );
  }
}

class StringCell extends StatelessWidget {
  final String value;

  const StringCell(
    this.value, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MainText(
      value,
      alignment: TextAlign.start,
    );
  }
}
