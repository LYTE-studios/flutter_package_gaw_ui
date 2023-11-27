import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class NoItemsItem extends StatelessWidget {
  final String label;
  const NoItemsItem({super.key, this.label = 'No items'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(
          PaddingSizes.mainPadding,
        ),
        child: MainText(
          label,
          color: GawTheme.unselectedText,
        ),
      ),
    );
  }
}
