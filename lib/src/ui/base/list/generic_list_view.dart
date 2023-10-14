import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class GenericListView extends StatefulWidget {
  final String? title;

  final String? valueName;

  final Function()? onDelete;

  final Function(String)? onSearch;

  final bool showFooter;

  const GenericListView({
    super.key,
    this.title,
    this.valueName,
    this.onDelete,
    this.onSearch,
    this.showFooter = true,
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
            children: [],
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
              totalItems: 100,
              pages: 100 ~/ 25,
              itemsPerPage: 25,
            ),
          ),
        ),
      ],
    );
  }
}
