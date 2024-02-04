import 'package:flutter/material.dart';
import 'package:gaw_ui/src/ui/base/loading/loading_spinner.dart';
import 'package:gaw_ui/src/ui/base/padding/padding_sizes.dart';

class LoadingSwitcher extends StatelessWidget {
  final bool loading;

  final Widget child;

  final Color? backgroundColor;
  final Color? color;

  const LoadingSwitcher({
    super.key,
    this.loading = true,
    required this.child,
    this.backgroundColor,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(
        milliseconds: 200,
      ),
      child: loading
          ? Padding(
              padding: const EdgeInsets.all(
                PaddingSizes.smallPadding,
              ),
              child: Container(
                color: backgroundColor ?? Colors.transparent,
                child: LoadingSpinner(
                  color: color,
                ),
              ),
            )
          : child,
    );
  }
}
