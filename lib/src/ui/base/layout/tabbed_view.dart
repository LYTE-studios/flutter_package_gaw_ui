import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TabbedView extends StatefulWidget {
  final List<String> tabs;

  final int selectedIndex;

  final List<Widget> pages;

  final Function(int)? onPageIndexChange;

  final bool isScreenSheet;

  final Function(DateTime? startTime, DateTime? endTime)? onReloadTimes;

  const TabbedView({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.pages,
    this.onPageIndexChange,
    this.isScreenSheet = false,
    this.onReloadTimes,
  });

  @override
  State<TabbedView> createState() => _TabbedViewState();
}

class _TabbedViewState extends State<TabbedView> {
  final OverlayPortalController controller = OverlayPortalController();

  DateIntervalSelectable? selectable = DateIntervalSelectable.thisYear;

  late PickerDateRange? range = selectable?.getDateRange();

  late DateTime? startTime = range?.startDate;

  late DateTime? endTime = range?.endDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.isShowing) {
          controller.toggle();
        }
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return OverlayPortal(
          controller: controller,
          overlayChildBuilder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    right: PaddingSizes.mainPadding,
                  ),
                  child: SizedBox(
                    height: constraints.maxHeight - 56,
                    width: 400,
                    child: CmsDateRangePicker(
                      selectable: selectable,
                      initialStart: startTime,
                      initialEnd: endTime,
                      onUpdateSelectable: (DateIntervalSelectable? selectable) {
                        if (selectable == null) {
                          setState(() {
                            this.selectable = null;
                          });
                          return;
                        }
                        if (selectable == this.selectable) {
                          setState(() {
                            this.selectable = null;
                            startTime = null;
                            endTime = null;
                          });
                          return;
                        }

                        PickerDateRange range = selectable.getDateRange();

                        setState(() {
                          this.selectable = selectable;
                          startTime = range.startDate!;
                          endTime = range.endDate!;
                        });
                      },
                      onUpdateDates: (startTime, endTime) {
                        controller.toggle();
                        widget.onReloadTimes?.call(startTime, endTime);
                      },
                    ),
                  ),
                ),
              ],
            );
          },
          child: Column(
            children: [
              SizedBox(
                height: 56,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ...buildHeaders(),
                    const Spacer(),
                    Visibility(
                      visible: widget.onReloadTimes != null,
                      child: CmsExpandableDateRangePicker(
                        toggleExpand: controller.toggle,
                        color: GawTheme.secondaryTint,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: GawTheme.clearText,
                    border: Border.all(
                      color: GawTheme.unselectedBackground,
                    ),
                    boxShadow: const [
                      Shadows.heavyShadow,
                    ],
                    borderRadius: widget.isScreenSheet
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          )
                        : BorderRadius.circular(7),
                  ),
                  child: widget.pages[widget.selectedIndex],
                ),
              ),
            ],
          ),
        );
      }),
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
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: PaddingSizes.smallPadding,
      ),
      child: ColorlessInkWell(
        onTap: onTap,
        child: Container(
          height: 36,
          width: 120,
          decoration: BoxDecoration(
            boxShadow: const [
              Shadows.mainShadow,
            ],
            color: selected
                ? GawTheme.unselectedMainTint
                : GawTheme.unselectedBackground,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Center(
            child: MainText(
              label,
              textStyleOverride: TextStyle(
                color:
                    selected ? GawTheme.secondaryTint : GawTheme.unselectedText,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
