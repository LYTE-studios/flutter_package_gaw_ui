import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

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
  State<DateIntervalPicker> createState() => DateIntervalPickerState();
}

class DateIntervalPickerState extends State<DateIntervalPicker>
    with TickerProviderStateMixin {
  PersistentBottomSheetController? controller;

  late AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 1000,
    ),
  );

  void showPicker() {
    widget.onShowPicker?.call();
    controller = (showModalBottomSheet(
      context: widget.scaffoldKey.currentContext!,
      builder: //widget.scaffoldKey.currentState?.showBottomSheet(
          (context) => DateRangePicker(
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

class DateRangePicker extends StatefulWidget {
  final Function(DateTime, DateTime)? onRangeSelected;

  final bool isSheet;

  final DateTime? initialStart;

  final DateTime? initialEnd;

  const DateRangePicker({
    super.key,
    this.onRangeSelected,
    this.isSheet = true,
    this.initialStart,
    this.initialEnd,
  });

  @override
  State<DateRangePicker> createState() => DateRangePickerState();
}

class DateRangePickerState extends State<DateRangePicker> {
  late DateTime? start = widget.initialStart;

  late DateTime? end = widget.initialEnd;

  @override
  void didChangeDependencies() {
    setState(() {
      start = widget.initialStart;
      end = widget.initialEnd;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: !widget.isSheet
          ? const EdgeInsets.all(PaddingSizes.smallPadding)
          : const EdgeInsets.all(PaddingSizes.mainPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.isSheet,
            child: Column(
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
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: GawTheme.unselectedText.withOpacity(0.6),
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
                        child: SfDateRangePicker(
                          initialSelectedRange: PickerDateRange(
                            start,
                            end,
                          ),
                          backgroundColor: Colors.transparent,
                          onSelectionChanged:
                              (dateRangePickerSelectionChangedArgs) {
                            PickerDateRange range =
                                dateRangePickerSelectionChangedArgs.value;

                            setState(() {
                              start = range.startDate;
                              end = range.endDate;
                            });
                          },
                          viewSpacing: PaddingSizes.mainPadding,
                          selectionMode: DateRangePickerSelectionMode.range,
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
                          startRangeSelectionColor: GawTheme.secondaryTint,
                          endRangeSelectionColor: GawTheme.secondaryTint,
                          navigationDirection:
                              DateRangePickerNavigationDirection.vertical,
                          navigationMode: DateRangePickerNavigationMode.scroll,
                          headerStyle: DateRangePickerHeaderStyle(
                            backgroundColor: GawTheme.pickerBackground,
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
                            firstDayOfWeek: 1,
                            numberOfWeeksInView: 5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: PaddingSizes.smallPadding,
                      vertical: !widget.isSheet
                          ? PaddingSizes.smallPadding
                          : PaddingSizes.bigPadding,
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
                        label: LocaleKeys.selectDates.tr(),
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
