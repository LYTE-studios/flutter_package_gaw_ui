import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class GenericListView extends StatefulWidget {
  final String? title;

  final bool loading;

  final String? valueName;

  final Function()? onDelete;

  final Function(String)? onSearch;

  final bool showFooter;
  final bool showHeader;

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
    this.showHeader = true,
    required this.rows,
    this.totalItems,
    this.itemsPerPage,
    required this.header,
  });

  @override
  State<GenericListView> createState() => _GenericListViewState();
}

class _GenericListViewState extends State<GenericListView> {
  late final bool showPages =
      widget.totalItems == null || widget.itemsPerPage == null;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Visibility(
            visible: widget.showHeader,
            child: ListViewHeader(
              headerLabel: widget.title ?? '',
              onDelete: widget.onDelete,
              onSearch: widget.onSearch,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 700,
                ),
                child: SizedBox(
                  width: constraints.maxWidth,
                  child: Column(
                    children: [
                      widget.header,
                      Expanded(
                        child: ListView(
                          children: widget.rows,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: widget.showFooter,
            child: ListViewFooter(
              valueName: widget.valueName,
              totalItems: widget.totalItems ?? 0,
              pages: showPages ? 0 : widget.totalItems! ~/ widget.itemsPerPage!,
              itemsPerPage: widget.totalItems ?? 0,
            ),
          ),
        ],
      );
    });
  }
}
