import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/src/ui/base/list/base_list_item.dart';

class RowListItems extends StatelessWidget {
  final List<Widget> values;

  const RowListItems({
    super.key,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return BaseListItem(
      items: [],
    );
  }
}
