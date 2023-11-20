import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class GenericListView extends StatefulWidget {
  final String? title;

  final String? valueName;

  final Function()? onDelete;

  final Function(String)? onSearch;

  final bool showFooter;

  final List<Widget> rows;

  final int? totalItems;

  final int? itemsPerPage;

  const GenericListView({
    super.key,
    this.title,
    this.valueName,
    this.onDelete,
    this.onSearch,
    this.showFooter = true,
    required this.rows,
    this.totalItems,
    this.itemsPerPage,
  });

  @override
  State<GenericListView> createState() => _GenericListViewState();
}

class _GenericListViewState extends State<GenericListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: ListView(
            children: widget.rows,
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
