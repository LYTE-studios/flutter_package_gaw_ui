import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class GenericListView extends StatefulWidget {
  final String? title;

  final bool loading;

  final String? valueName;

  final Function()? onDelete;

  final Function(String)? onSearch;

  final bool showFooter;

  final List<Widget> rows;

  final int? totalItems;

  final int? itemsPerPage;

  final Widget header;

  const GenericListView({
    super.key,
    this.title,
    this.loading = false,
    this.valueName,
    this.onDelete,
    this.onSearch,
    this.showFooter = true,
    required this.rows,
    this.totalItems,
    this.itemsPerPage,
    required this.header,
  });

  static const double sColumn = 120;
  static const double mColumn = 160;
  static const double lColumn = 210;

  @override
  State<GenericListView> createState() => _GenericListViewState();
}

class _GenericListViewState extends State<GenericListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: PaddingSizes.mainPadding,
          ),
          child: ListViewHeader(
            headerLabel: widget.title ?? '',
            onDelete: widget.onDelete,
            onSearch: widget.onSearch,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PaddingSizes.extraBigPadding,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                widget.header,
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 42,
                  ),
                  child: LoadingSwitcher(
                    loading: widget.loading,
                    child: ListView(
                      shrinkWrap: true,
                      children: widget.rows,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: widget.showFooter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: PaddingSizes.mainPadding,
            ),
            child: ListViewFooter(
              valueName: widget.valueName,
              totalItems: widget.totalItems ?? 0,
              pages: widget.totalItems == null || widget.itemsPerPage == null
                  ? 0
                  : widget.totalItems! ~/ widget.itemsPerPage!,
              itemsPerPage: widget.totalItems ?? 0,
            ),
          ),
        ),
      ],
    );
  }
}
