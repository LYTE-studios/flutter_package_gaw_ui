import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class CmsExpandableDateRangePicker extends StatelessWidget {
  final Function(DateTime startTime, DateTime endTime)? onUpdateDates;

  final Function()? toggleExpand;

  final bool expanded;

  final DateTime? initialStart;
  final DateTime? initialEnd;

  final Function(DateIntervalSelectable)? onUpdateSelectable;

  final DateIntervalSelectable? selectable;

  const CmsExpandableDateRangePicker(
      {super.key,
      this.onUpdateDates,
      this.toggleExpand,
      this.expanded = false,
      this.initialStart,
      this.initialEnd,
      this.onUpdateSelectable,
      this.selectable});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ColorlessInkWell(
            onTap: toggleExpand,
            child: Padding(
              padding: const EdgeInsets.only(
                right: PaddingSizes.mainPadding,
                top: PaddingSizes.mainPadding,
              ),
              child: Container(
                width: 91,
                height: 38,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: GawTheme.clearBackground,
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 18,
                      width: 18,
                      child: SvgIcon(
                        PixelPerfectIcons.calendarMedium,
                        color: GawTheme.clearBackground,
                      ),
                    ),
                    SizedBox(
                      width: PaddingSizes.mainPadding,
                    ),
                    MainText(
                      'Filter',
                      color: GawTheme.clearBackground,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(
                PaddingSizes.mainPadding,
              ),
              child: Visibility(
                visible: expanded,
                child: CmsDateRangePicker(
                  initialStart: initialStart,
                  initialEnd: initialEnd,
                  onUpdateDates: onUpdateDates,
                  onUpdateSelectable: onUpdateSelectable,
                  selectable: selectable,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CmsDateRangePicker extends StatelessWidget {
  final Function(DateTime startTime, DateTime endTime)? onUpdateDates;

  final Function(DateIntervalSelectable)? onUpdateSelectable;

  final DateTime? initialStart;
  final DateTime? initialEnd;

  final DateIntervalSelectable? selectable;

  const CmsDateRangePicker({
    super.key,
    this.onUpdateDates,
    this.initialStart,
    this.initialEnd,
    this.selectable,
    this.onUpdateSelectable,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 480,
        maxHeight: 720,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: GawTheme.clearBackground,
        boxShadow: const [
          Shadows.heavyShadow,
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DateIntervalSelector(
            value: selectable,
            onIntervalSelected: onUpdateSelectable,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingSizes.mainPadding,
              ),
              child: DateRangePicker(
                isSheet: false,
                initialStart: initialStart,
                initialEnd: initialEnd,
                onRangeSelected: onUpdateDates,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DateIntervalSelector extends StatelessWidget {
  final DateIntervalSelectable? value;

  final Function(DateIntervalSelectable)? onIntervalSelected;

  const DateIntervalSelector({
    super.key,
    this.value,
    this.onIntervalSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(
              PaddingSizes.mainPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCheckBox(
                  DateIntervalSelectable.thisYear,
                ),
                buildCheckBox(
                  DateIntervalSelectable.thisMonth,
                ),
                buildCheckBox(
                  DateIntervalSelectable.thisWeek,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(
              PaddingSizes.mainPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCheckBox(
                  DateIntervalSelectable.lastYear,
                ),
                buildCheckBox(
                  DateIntervalSelectable.lastMonth,
                ),
                buildCheckBox(
                  DateIntervalSelectable.lastWeek,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCheckBox(DateIntervalSelectable selectable) {
    return Padding(
      padding: const EdgeInsets.all(PaddingSizes.smallPadding),
      child: NamedCheckBox(
        label: selectable.getLabel(),
        onToggle: () => onIntervalSelected?.call(selectable),
        value: value == selectable,
      ),
    );
  }
}