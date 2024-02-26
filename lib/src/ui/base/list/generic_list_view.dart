import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class GenericListView extends StatefulWidget {
  final String? title;

  final bool loading;

  final String? valueName;

  final Function()? onDelete;
  final bool canDelete;

  final Function(String)? onSearch;

  final int? page;

  final Function(int)? onEditItemCount;
  final Function(int)? onChangePage;

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
    this.canDelete = false,
    this.page,
    this.onSearch,
    this.showFooter = true,
    this.showHeader = true,
    required this.rows,
    this.totalItems,
    this.itemsPerPage,
    this.onEditItemCount,
    this.onChangePage,
    required this.header,
  });

  @override
  State<GenericListView> createState() => _GenericListViewState();
}

class _GenericListViewState extends State<GenericListView>
    with ScreenStateMixin {
  late final bool showPages =
      widget.totalItems == null || widget.itemsPerPage == null;

  bool isLateLoading = false;

  int getPageCount() {
    if (widget.itemsPerPage == null || widget.totalItems == null) {
      return 0;
    }

    if (widget.itemsPerPage! >= widget.rows.length) {
      return 1;
    }

    return widget.totalItems! ~/ widget.itemsPerPage!;
  }

  void setLateLoader(String query) {
    if (isLateLoading) {
      return;
    }

    setData(() {
      isLateLoading = true;
    });
    Future.delayed(
      const Duration(
        milliseconds: 700,
      ),
    ).then((_) {
      setData(() {
        isLateLoading = false;
      });
      widget.onSearch?.call(query);
    });
  }

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
              onChange: (String value) {
                setLateLoader(value);
              },
              onSearch: (String value) {
                widget.onSearch?.call(value);
              },
              canDelete: widget.canDelete,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 1121,
                ),
                child: SizedBox(
                  width: constraints.maxWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      widget.header,
                      Expanded(
                        child: LoadingSwitcher(
                          loading: widget.loading,
                          child: widget.rows.isEmpty
                              ? const Center(
                                  child: MainText(
                                    // TODO COPY
                                    'No items',
                                  ),
                                )
                              : ListView(
                                  children: widget.rows,
                                ),
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
              items: (widget.itemsPerPage ?? 0) > (widget.totalItems ?? 0)
                  ? (widget.totalItems ?? 0)
                  : (widget.itemsPerPage ?? 0),
              page: widget.page,
              onChangePage: widget.onChangePage,
              onChangeItemsPerPage: widget.onEditItemCount,
              valueName: widget.valueName,
              totalItems: widget.totalItems ?? 0,
              pages: getPageCount(),
              itemsPerPage: widget.totalItems ?? 0,
            ),
          ),
        ],
      );
    });
  }
}
