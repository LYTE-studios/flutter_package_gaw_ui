import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/forms/static/wizard_header_item.dart';

class WizardHeader extends StatelessWidget {
  final int selectedIndex;

  final List<String> items;

  const WizardHeader({
    super.key,
    required this.items,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingSizes.bigPadding,
      ),
      child: Row(
        children: buildItems(context),
      ),
    );
  }

  List<Widget> buildItems(BuildContext context) {
    List<Widget> widgets = [];

    for (String item in items) {
      widgets.add(
        Expanded(
          flex: item == items.last ? 0 : 1,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              WizardHeaderItem(
                active: items.indexOf(item) == selectedIndex,
                label: item,
                indexed: (items.indexOf(item) + 1).toString(),
              ),
              Visibility(
                visible: item != items.last,
                child: Flexible(
                  child: FormItemDivider(
                    active: [
                      selectedIndex,
                      selectedIndex - 1,
                    ].contains(
                      items.indexOf(item),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return widgets;
  }
}
