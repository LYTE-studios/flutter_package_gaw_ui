import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ListViewFooter extends StatelessWidget {
  final String? valueName;

  final int totalItems;

  final int itemsPerPage;

  final int page;

  final int pages;

  final Function(int)? onChangeItemsPerPage;

  final Function(int)? onChangePage;

  const ListViewFooter({
    super.key,
    this.valueName,
    required this.totalItems,
    this.itemsPerPage = 25,
    this.page = 0,
    required this.pages,
    this.onChangeItemsPerPage,
    this.onChangePage,
  });

  static const String kItems = 'item';

  static const String kRange = 'range';

  static const String kTotal = 'total';

  static const String kPages = 'pages';

  String getRange() {
    final int total = (itemsPerPage * pages);

    return (itemsPerPage - total).toString();
  }

  @override
  Widget build(BuildContext context) {
    final name = valueName ?? LocaleKeys.items.tr().toLowerCase();

    return Container(
      height: 42,
      decoration: const BoxDecoration(
        color: GawTheme.clearText,
        border: Border(
          top: Borders.mainSide,
        ),
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
                onSubmitted: (value) {
                  int? items = int.tryParse(value);

                  if (items == null) {
                    return;
                  }

                  if (items <= totalItems) {
                    onChangeItemsPerPage?.call(items);
                  }
                },
                textAlign: TextAlign.center,
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
                ListViewFooter.kRange: getRange(),
                ListViewFooter.kTotal: totalItems.toString(),
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
                onSubmitted: (value) {
                  int? newPage = int.tryParse(value);

                  if (newPage == null) {
                    return;
                  }

                  if (newPage <= pages) {
                    onChangePage?.call(pages);
                  }
                },
                textAlign: TextAlign.center,
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
                  ListViewFooter.kPages: pages.toString(),
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
            child: GestureDetector(
              onTap: () {
                if (page > 0) {
                  onChangePage?.call(page - 1);
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
            child: GestureDetector(
              onTap: () {
                if (page < pages) {
                  onChangePage?.call(page + 1);
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
    );
  }
}
