import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class TabbedView extends StatefulWidget {
  final List<String> tabs;

  final int selectedIndex;

  final List<Widget> pages;

  final Function(int)? onPageIndexChange;

  const TabbedView({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.pages,
    this.onPageIndexChange,
  });

  @override
  State<TabbedView> createState() => _TabbedViewState();
}

class _TabbedViewState extends State<TabbedView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: buildHeaders(),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: GawTheme.unselectedText,
            ),
            borderRadius: BorderRadius.circular(12),
            color: GawTheme.clearBackground,
          ),
          child: widget.pages[widget.selectedIndex],
        ),
      ],
    );
  }

  List<Widget> buildHeaders() {
    List<Widget> widgets = [];

    for (String label in widget.tabs) {
      int index = widget.tabs.indexOf(label);
      widgets.add(
        _TabHeader(
          label: label,
          selected: widget.selectedIndex == index,
          onTap: () {
            widget.onPageIndexChange?.call(index);
          },
        ),
      );
    }

    return widgets;
  }
}

class _TabHeader extends StatelessWidget {
  final String label;

  final bool selected;

  final Function()? onTap;

  const _TabHeader({
    required this.label,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: PaddingSizes.smallPadding),
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSizes.smallPadding,
          vertical: PaddingSizes.extraSmallPadding,
        ),
        decoration: BoxDecoration(
          color: selected
              ? GawTheme.unselectedMainTint
              : GawTheme.unselectedBackground,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        child: MainText(
          label,
          color: selected ? GawTheme.secondaryTint : GawTheme.unselectedText,
        ),
      ),
    );
  }
}