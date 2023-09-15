import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_api/flutter_package_gaw_api.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/ui/base/tools/tool_selector.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateIntervalPicker extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  final DateTime? startDate;

  final DateTime? endDate;

  final Function()? onShowPicker;

  final Function()? onPopPicker;

  final Function(DateTime, DateTime)? onRangeSelected;

  const DateIntervalPicker({
    super.key,
    required this.scaffoldKey,
    this.onShowPicker,
    this.onPopPicker,
    this.startDate,
    this.endDate,
    this.onRangeSelected,
  });

  @override
  State<DateIntervalPicker> createState() => _DateIntervalPickerState();
}

class _DateIntervalPickerState extends State<DateIntervalPicker> {
  PersistentBottomSheetController? controller;

  void showPicker() {
    widget.onShowPicker?.call();
    controller = widget.scaffoldKey.currentState?.showBottomSheet(
      (context) => _DateRangePicker(
        onRangeSelected: (start, end) {
          controller?.close();
          widget.onRangeSelected?.call(start, end);
        },
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      backgroundColor: GawTheme.clearBackground,
      constraints: BoxConstraints(
        maxHeight: widget.scaffoldKey.currentContext!.size!.height * 0.85,
      ),
    );

    controller?.closed.whenComplete(() {
      widget.onPopPicker?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: showPicker,
        child: Container(
          height: 56,
          width: constraints.maxWidth,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: PaddingSizes.bigPadding,
                ),
                child: SizedBox(
                  height: 27,
                  width: 27,
                  child: SvgIcon(
                    PixelPerfectIcons.calendarNormal,
                    color: GawTheme.text,
                  ),
                ),
              ),
              MainText(
                GawDateUtil.formatDateInterval(
                    widget.startDate, widget.endDate),
                textStyleOverride: TextStyles.mainStyle.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _DateRangePicker extends StatefulWidget {
  final Function(DateTime, DateTime)? onRangeSelected;

  const _DateRangePicker({
    super.key,
    this.onRangeSelected,
  });

  @override
  State<_DateRangePicker> createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<_DateRangePicker> {
  DateTime? start;

  DateTime? end;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingSizes.mainPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: ToolSelector(),
          ),
          const SizedBox(
            height: PaddingSizes.bigPadding,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: PaddingSizes.extraBigPadding,
              left: PaddingSizes.bigPadding,
              bottom: PaddingSizes.mainPadding,
            ),
            child: MainText(
              'Select dates',
              textStyleOverride: TextStyles.titleStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(PaddingSizes.mainPadding),
              child: Column(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double cellWidth = constraints.maxWidth / 7;

                      return Container(
                        height: 42,
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: GawTheme.unselectedText,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: cellWidth,
                              child: const Center(
                                child: MainText(
                                  'Sun',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: cellWidth,
                              child: const Center(
                                child: MainText(
                                  'Mon',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: cellWidth,
                              child: const Center(
                                child: MainText(
                                  'Tue',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: cellWidth,
                              child: const Center(
                                child: MainText(
                                  'Wed',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: cellWidth,
                              child: const Center(
                                child: MainText(
                                  'Thu',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: cellWidth,
                              child: const Center(
                                child: MainText(
                                  'Fri',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: cellWidth,
                              child: const Center(
                                child: MainText(
                                  'Sat',
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Expanded(
                    child: SfDateRangePicker(
                      onSelectionChanged:
                          (dateRangePickerSelectionChangedArgs) {
                        if (dateRangePickerSelectionChangedArgs
                            is PickerDateRange) {
                          PickerDateRange range =
                              dateRangePickerSelectionChangedArgs
                                  as PickerDateRange;
                          setState(() {
                            start = range.startDate;
                            end = range.endDate;
                          });
                        }
                      },
                      viewSpacing: 0,
                      selectionMode: DateRangePickerSelectionMode.range,
                      view: DateRangePickerView.month,
                      selectionShape: DateRangePickerSelectionShape.rectangle,
                      enableMultiView: true,
                      allowViewNavigation: true,
                      todayHighlightColor: GawTheme.secondaryTint,
                      rangeSelectionColor: GawTheme.secondaryTint.withOpacity(
                        0.1,
                      ),
                      startRangeSelectionColor: GawTheme.secondaryTint,
                      endRangeSelectionColor: GawTheme.secondaryTint,
                      navigationDirection:
                          DateRangePickerNavigationDirection.vertical,
                      navigationMode: DateRangePickerNavigationMode.scroll,
                      headerStyle: DateRangePickerHeaderStyle(
                        backgroundColor: GawTheme.clearBackground,
                        textStyle: TextStyles.titleStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      selectionColor: GawTheme.secondaryTint,
                      monthViewSettings: DateRangePickerMonthViewSettings(
                        viewHeaderHeight: 0,
                        viewHeaderStyle: DateRangePickerViewHeaderStyle(
                          backgroundColor: Colors.transparent,
                          textStyle: TextStyles.mainStyle,
                        ),
                        dayFormat: 'E',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: PaddingSizes.smallPadding,
                      vertical: PaddingSizes.bigPadding,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: GenericButton(
                        onTap: () {
                          if (start == null || end == null) {
                            return;
                          }
                          widget.onRangeSelected?.call(start!, end!);
                        },
                        label: 'Select dates',
                        color: start == null || end == null
                            ? GawTheme.unselectedBackground
                            : GawTheme.secondaryTint,
                        textColor: GawTheme.clearText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
