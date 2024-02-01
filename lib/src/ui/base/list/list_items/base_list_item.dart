import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class BaseListItem extends StatelessWidget {
  final Map<Widget, double> items;

  final bool selected;
  final Function(bool?)? onUpdate;
  final Function()? onSelected;

  const BaseListItem({
    super.key,
    required this.items,
    this.selected = false,
    this.onUpdate,
    this.onSelected,
  });

  static List<Widget> inflateRow(List<Widget> widgets) {
    widgets.insert(
      widgets.length - 1,
      const Spacer(),
    );
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];

    items.forEach((widget, width) {
      widgets.add(
        SizedBox(
          width: width,
          child: widget,
        ),
      );
    });

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingSizes.bigPadding,
      ),
      child: ColorlessInkWell(
        onTap: onSelected,
        child: Container(
          height: 56,
          decoration: const BoxDecoration(
            border: Border(
              bottom: Borders.lightSide,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PaddingSizes.smallPadding,
            ),
            child: Row(
              children: [
                Visibility(
                  visible: onUpdate != null,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: PaddingSizes.smallPadding,
                    ),
                    child: SizedBox(
                      height: 21,
                      width: 21,
                      child: SmallCheckBox(
                        value: selected,
                        color: GawTheme.mainTint,
                        onToggle: () => onUpdate?.call(!selected),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: inflateRow(widgets),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
