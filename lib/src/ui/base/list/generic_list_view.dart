import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/mixins/screen_state_mixin.dart';

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

  final double? minWidth;

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
    this.minWidth,
  });

  @override
  State<GenericListView> createState() => _GenericListViewState();
}

class _GenericListViewState extends State<GenericListView>
    with ScreenStateMixin {
  late final bool showPages =
      widget.totalItems == null || widget.itemsPerPage == null;

  bool isLateLoading = false;

  String? currentQuery;

  int getPageCount() {
    if (widget.itemsPerPage == null || widget.totalItems == null) {
      return 0;
    }

    double count = widget.totalItems! / widget.itemsPerPage!;

    if (count.roundToDouble() < count) {
      return count.round() + 1;
    }

    return count.round();
  }

  void setLateLoader(String query) {
    setState(() {
      currentQuery = query;
    });

    if (isLateLoading) {
      return;
    }

    setState(() {
      isLateLoading = true;
    });
    Future.delayed(
      const Duration(
        milliseconds: 700,
      ),
    ).then((_) {
      setState(() {
        isLateLoading = false;
      });

      if (currentQuery == query) {
        widget.onSearch?.call(query);
        return;
      }

      setLateLoader(currentQuery ?? '');
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
              onSearch: widget.onSearch,
              canDelete: widget.canDelete,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: widget.minWidth ?? 1121,
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
                              ? Center(
                                  child: MainText(
                                    LocaleKeys.noItems.tr(),
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
              items: widget.rows.length,
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
