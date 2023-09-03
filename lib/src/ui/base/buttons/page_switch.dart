import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PageSwitch extends StatelessWidget {
  final List<String> pageNames;

  final int selectedIndex;

  final Function(int?)? onChangedIndex;

  const PageSwitch({
    super.key,
    required this.pageNames,
    required this.selectedIndex,
    this.onChangedIndex,
  });

  final double switchPadding = PaddingSizes.extraMiniPadding;

  final double switchFaultMargin = 0.5;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: GawTheme.unselectedBackground,
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          width: constraints.maxWidth,
          child: Padding(
            padding: EdgeInsets.all(
              switchPadding,
            ),
            child: ToggleSwitch(
              customWidths: [
                (constraints.maxWidth / 2) - switchPadding - switchFaultMargin,
                (constraints.maxWidth / 2) - switchPadding - switchFaultMargin,
              ],
              animate: true,
              totalSwitches: pageNames.length,
              labels: pageNames,
              initialLabelIndex: selectedIndex,
              onToggle: onChangedIndex,
              radiusStyle: true,
              cornerRadius: 20,
              activeBgColor: const [GawTheme.clearBackground],
              activeFgColor: GawTheme.text,
              inactiveBgColor: GawTheme.unselectedBackground.withOpacity(0),
              inactiveFgColor: GawTheme.unselectedText,
              centerText: true,
            ),
          ),
        );
      },
    );
  }
}
