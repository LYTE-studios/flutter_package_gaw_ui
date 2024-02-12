import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ListViewFooter extends StatefulWidget {
  final String? valueName;

  final int totalItems;

  final int itemsPerPage;

  final int items;

  final int? page;

  final int pages;

  final Function(int)? onChangeItemsPerPage;

  final Function(int)? onChangePage;

  const ListViewFooter({
    super.key,
    this.valueName,
    this.items = 0,
    this.page,
    required this.totalItems,
    this.itemsPerPage = 25,
    required this.pages,
    this.onChangeItemsPerPage,
    this.onChangePage,
  });

  static const String kItems = 'item';

  static const String kRange = 'range';

  static const String kTotal = 'total';

  static const String kPages = 'pages';

  @override
  State<ListViewFooter> createState() => _ListViewFooterState();
}

class _ListViewFooterState extends State<ListViewFooter> {
  late final TextEditingController tecPage = TextEditingController(
    text: widget.page?.toString() ?? '',
  )..addListener(() {
      int? newPage = int.tryParse(tecPage.text);

      if (newPage == null) {
        return;
      }

      if (newPage <= widget.pages) {
        widget.onChangePage?.call(widget.pages);
      }
    });

  String getRange() {
    final int total = (widget.itemsPerPage * widget.pages);

    return (widget.itemsPerPage - total).toString();
  }

  @override
  Widget build(BuildContext context) {
    final name = widget.valueName ?? LocaleKeys.items.tr().toLowerCase();

    int page = widget.page ?? 0;

    return Container(
      height: 42,
      decoration: const BoxDecoration(
        color: GawTheme.clearText,
        border: Border(
          top: Borders.mainSide,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PaddingSizes.mainPadding,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 56,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PaddingSizes.smallPadding,
                  vertical: PaddingSizes.smallPadding,
                ),
                child: TextField(
                  onSubmitted: (String value) =>
                      widget.onChangeItemsPerPage?.call(int.parse(value)),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textAlign: TextAlign.center,
                  cursorHeight: 14,
                  style: TextStyles.mainStyle.copyWith(
                    fontSize: 12,
                  ),
                  decoration: InputStyles.mainDecoration,
                ),
              ),
            ),
            MainText(
              LocaleKeys.paramPerPage.tr(
                namedArgs: {
                  ListViewFooter.kItems: name,
                },
              ),
              textStyleOverride: TextStyles.mainStyle.copyWith(
                color: GawTheme.unselectedText,
                fontSize: 14,
              ),
            ),
            const SizedBox(
              width: PaddingSizes.smallPadding,
            ),
            MainText(
              LocaleKeys.paramOfParamParam.tr(
                namedArgs: {
                  ListViewFooter.kRange: widget.items.toString(),
                  ListViewFooter.kTotal: widget.totalItems.toString(),
                  ListViewFooter.kItems: name,
                },
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 56,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: PaddingSizes.smallPadding,
                  vertical: PaddingSizes.smallPadding,
                ),
                child: TextField(
                  onSubmitted: (String value) {
                    int index = int.parse(value);

                    if (index <= widget.pages) {
                      widget.onChangePage?.call(index);
                    }
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textAlign: TextAlign.center,
                  cursorHeight: 14,
                  style: TextStyles.mainStyle.copyWith(
                    fontSize: 12,
                  ),
                  decoration: InputStyles.mainDecoration,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingSizes.extraSmallPadding,
              ),
              child: MainText(
                LocaleKeys.ofParamPages.tr(
                  namedArgs: {
                    ListViewFooter.kPages: widget.pages.toString(),
                  },
                ),
                textStyleOverride: TextStyles.mainStyle.copyWith(
                  color: GawTheme.unselectedText,
                  fontSize: 14,
                ),
              ),
            ),
            SizedBox(
              height: 12,
              width: 12,
              child: ColorlessInkWell(
                onTap: () {
                  if (page > 0) {
                    widget.onChangePage?.call(page - 1);
                  }
                },
                child: const RotatedBox(
                  quarterTurns: 2,
                  child: SvgIcon(
                    PixelPerfectIcons.arrowRightMedium,
                    color: GawTheme.text,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 12,
              width: 12,
              child: ColorlessInkWell(
                onTap: () {
                  if (page < widget.pages) {
                    widget.onChangePage?.call(page + 1);
                  }
                },
                child: const SvgIcon(
                  PixelPerfectIcons.arrowRightMedium,
                  color: GawTheme.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
