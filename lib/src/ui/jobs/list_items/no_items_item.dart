import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class NoItemsItem extends StatelessWidget {
  const NoItemsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(
          PaddingSizes.mainPadding,
        ),
        child: const MainText(
          'No items',
          color: GawTheme.unselectedText,
        ),
      ),
    );
  }
}
