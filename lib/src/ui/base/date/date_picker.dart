import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateIntervalPicker extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  final DateTime? startDate;

  final DateTime? endDate;

  final DateTime? minDate;

  final DateTime? maxDate;

  final Function()? onShowPicker;

  final Function()? onPopPicker;

  final Function(DateTime, DateTime)? onRangeSelected;
  final Function()? onClear;

  const DateIntervalPicker({
    super.key,
    required this.scaffoldKey,
    this.onShowPicker,
    this.onPopPicker,
    this.startDate,
    this.endDate,
    this.minDate,
    this.maxDate,
    this.onRangeSelected,
    this.onClear,
  });

  @override
  State<DateIntervalPicker> createState() => DateIntervalPickerState();
}

class DateIntervalPickerState extends State<DateIntervalPicker>
    with TickerProviderStateMixin {
  PersistentBottomSheetController? controller;

  late AnimationController animationController = AnimationController(
    vsync: this,
    reverseDuration: const Duration(
      milliseconds: 300,
    ),
    duration: const Duration(
      milliseconds: 500,
    ),
  );

  void showPicker() {
    widget.onShowPicker?.call();
    controller = (showModalBottomSheet(
      context: widget.scaffoldKey.currentContext!,
      builder: //widget.scaffoldKey.currentState?.showBottomSheet(
          (context) => DateRangePicker(
        minDate: widget.minDate,
        maxDate: widget.maxDate,
        onRangeSelected: (start, end) {
          //controller?.close();
          widget.onRangeSelected?.call(start, end);
          Navigator.of(context).pop();
        },
      ),
      transitionAnimationController: animationController,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      )),
      backgroundColor: GawTheme.background,
      constraints: BoxConstraints(
        maxHeight: widget.scaffoldKey.currentContext!.size!.height * 0.85,
      ),
    )..whenComplete(() {
        widget.onPopPicker?.call();
      })) as PersistentBottomSheetController?;
  }

  void closeSheet() {
    controller?.close.call();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ColorlessInkWell(
        onTap: showPicker,
        child: Row(
          children: [
            Expanded(
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
                        widget.startDate,
                        widget.endDate,
                      ),
                      textStyleOverride: TextStyles.mainStyle.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: widget.startDate != null || widget.endDate != null,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: PaddingSizes.mainPadding,
                ),
                child: ColorlessInkWell(
                  onTap: widget.onClear,
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: GawTheme.error,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: PaddingSizes.mainPadding,
                      ),
                      child: SizedBox(
                        child: SvgIcon(
                          PixelPerfectIcons.trashMedium,
                          color: GawTheme.error,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

class DateRangePicker extends StatefulWidget {
  final bool singleDatePicker;

  final Function(DateTime, DateTime)? onRangeSelected;

  final Function(DateTime)? onDateSelected;

  final Function()? onDateChanged;

  final bool isSheet;

  final DateTime? initialStart;

  final DateTime? initialEnd;

  final DateTime? minDate;

  final DateTime? maxDate;

  const DateRangePicker({
    super.key,
    this.singleDatePicker = false,
    this.onDateSelected,
    this.onRangeSelected,
    this.onDateChanged,
    this.isSheet = true,
    this.initialStart,
    this.initialEnd,
    this.minDate,
    this.maxDate,
  });

  @override
  State<DateRangePicker> createState() => DateRangePickerState();
}

class DateRangePickerState extends State<DateRangePicker> {
  ValueKey<bool> pickerKey = const ValueKey(true);

  late DateTime? start = widget.initialStart;
  late DateTime? end = widget.initialEnd;

  late DateTime? oldStart = start;
  late DateTime? oldEnd = end;

  @override
  Widget build(BuildContext context) {
    if (oldStart != widget.initialStart || oldEnd != widget.initialEnd) {
      setState(() {
        start = widget.initialStart;
        end = widget.initialEnd;

        oldStart = widget.initialStart;
        oldEnd = widget.initialEnd;

        pickerKey = ValueKey(!pickerKey.value);
      });
    }

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(12),
        topLeft: Radius.circular(12),
      ),
      child: Scaffold(
        backgroundColor: GawTheme.background,
        body: Padding(
          padding: !widget.isSheet
              ? const EdgeInsets.all(PaddingSizes.smallPadding)
              : const EdgeInsets.all(PaddingSizes.mainPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: widget.isSheet,
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
                        LocaleKeys.selectDates.tr(),
                        textStyleOverride: TextStyles.titleStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: !widget.isSheet
                      ? EdgeInsets.zero
                      : const EdgeInsets.all(PaddingSizes.mainPadding),
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
                                  color: GawTheme.text,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: cellWidth,
                                  child: Center(
                                    child: MainText(
                                      LocaleKeys.mon.tr(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: cellWidth,
                                  child: Center(
                                    child: MainText(
                                      LocaleKeys.tue.tr(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: cellWidth,
                                  child: Center(
                                    child: MainText(
                                      LocaleKeys.wed.tr(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: cellWidth,
                                  child: Center(
                                    child: MainText(
                                      LocaleKeys.thu.tr(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: cellWidth,
                                  child: Center(
                                    child: MainText(
                                      LocaleKeys.fri.tr(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: cellWidth,
                                  child: Center(
                                    child: MainText(
                                      LocaleKeys.sat.tr(),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: cellWidth,
                                  child: Center(
                                    child: MainText(
                                      LocaleKeys.sun.tr(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: SizedBox(
                            height: 540,
                            child: widget.singleDatePicker
                                ? SfDateRangePicker(
                                    key: pickerKey,
                                    minDate: widget.minDate,
                                    maxDate: widget.maxDate,
                                    backgroundColor: GawTheme.background,
                                    initialSelectedDate: widget.initialStart,
                                    onSelectionChanged:
                                        (dateRangePickerSelectionChangedArgs) {
                                      widget.onDateChanged?.call();

                                      if (widget.singleDatePicker) {
                                        setState(() {
                                          start =
                                              dateRangePickerSelectionChangedArgs
                                                  .value;
                                        });
                                        return;
                                      }

                                      PickerDateRange range =
                                          dateRangePickerSelectionChangedArgs
                                              .value;

                                      setState(() {
                                        start = range.startDate;
                                        end = range.endDate;
                                      });
                                    },
                                    viewSpacing: PaddingSizes.mainPadding,
                                    selectionMode:
                                        DateRangePickerSelectionMode.single,
                                    view: DateRangePickerView.month,
                                    selectionShape:
                                        DateRangePickerSelectionShape.rectangle,
                                    enableMultiView: true,
                                    allowViewNavigation: true,
                                    todayHighlightColor: GawTheme.secondaryTint,
                                    selectionRadius: 1,
                                    rangeSelectionColor:
                                        GawTheme.secondaryTint.withOpacity(
                                      0.1,
                                    ),
                                    startRangeSelectionColor:
                                        GawTheme.secondaryTint,
                                    endRangeSelectionColor:
                                        GawTheme.secondaryTint,
                                    navigationDirection:
                                        DateRangePickerNavigationDirection
                                            .vertical,
                                    navigationMode:
                                        DateRangePickerNavigationMode.scroll,
                                    headerStyle: DateRangePickerHeaderStyle(
                                      backgroundColor:
                                          GawTheme.pickerBackground,
                                      textStyle: TextStyles.titleStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    selectionColor: GawTheme.secondaryTint,
                                    monthViewSettings:
                                        DateRangePickerMonthViewSettings(
                                      viewHeaderHeight: 0,
                                      viewHeaderStyle:
                                          DateRangePickerViewHeaderStyle(
                                        backgroundColor: GawTheme.background,
                                        textStyle: TextStyles.mainStyle,
                                      ),
                                      dayFormat: 'E',
                                      firstDayOfWeek: 1,
                                      numberOfWeeksInView: 5,
                                    ),
                                  )
                                : SfDateRangePicker(
                                    key: pickerKey,
                                    minDate: widget.minDate,
                                    maxDate: widget.maxDate,
                                    initialSelectedRange: PickerDateRange(
                                      start,
                                      end,
                                    ),
                                    backgroundColor: GawTheme.background,
                                    onSelectionChanged:
                                        (dateRangePickerSelectionChangedArgs) {
                                      widget.onDateChanged?.call();

                                      PickerDateRange range =
                                          dateRangePickerSelectionChangedArgs
                                              .value;

                                      setState(() {
                                        start = range.startDate;
                                        end = range.endDate;
                                      });
                                    },
                                    viewSpacing: PaddingSizes.mainPadding,
                                    selectionMode:
                                        DateRangePickerSelectionMode.range,
                                    view: DateRangePickerView.month,
                                    selectionShape:
                                        DateRangePickerSelectionShape.rectangle,
                                    enableMultiView: true,
                                    allowViewNavigation: true,
                                    todayHighlightColor: GawTheme.secondaryTint,
                                    selectionRadius: 1,
                                    rangeSelectionColor:
                                        GawTheme.secondaryTint.withOpacity(
                                      0.1,
                                    ),
                                    startRangeSelectionColor:
                                        GawTheme.secondaryTint,
                                    endRangeSelectionColor:
                                        GawTheme.secondaryTint,
                                    navigationDirection:
                                        DateRangePickerNavigationDirection
                                            .vertical,
                                    navigationMode:
                                        DateRangePickerNavigationMode.scroll,
                                    headerStyle: DateRangePickerHeaderStyle(
                                      backgroundColor: GawTheme.background,
                                      textStyle: TextStyles.titleStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    selectionColor: GawTheme.secondaryTint,
                                    monthViewSettings:
                                        DateRangePickerMonthViewSettings(
                                      viewHeaderHeight: 0,
                                      viewHeaderStyle:
                                          DateRangePickerViewHeaderStyle(
                                        backgroundColor: GawTheme.background,
                                        textStyle: TextStyles.mainStyle,
                                      ),
                                      dayFormat: 'E',
                                      firstDayOfWeek: 1,
                                      numberOfWeeksInView: 5,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: !widget.isSheet
                              ? PaddingSizes.smallPadding
                              : PaddingSizes.bigPadding,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ApplyStatusButton(
                            onTap: () {
                              if (widget.singleDatePicker && start != null) {
                                widget.onDateSelected?.call(start!);
                                return;
                              }

                              if (start == null || end == null) {
                                return;
                              }

                              widget.onRangeSelected?.call(start!, end!);
                            },
                            // TODO COPY
                            label: LocaleKeys.select.tr(),
                            color: (start != null && end != null) ||
                                    (widget.singleDatePicker && start != null)
                                ? GawTheme.secondaryTint
                                : GawTheme.unselectedBackground,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
