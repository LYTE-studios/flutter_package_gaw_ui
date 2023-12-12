import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/src/ui/base/loading/loading_spinner.dart';

class LoadingSwitcher extends StatelessWidget {
  final bool loading;

  final Widget child;

  final Color? backgroundColor;

  const LoadingSwitcher({
    super.key,
    this.loading = true,
    required this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(
        milliseconds: 200,
      ),
      child: loading
          ? Container(
              color: backgroundColor ?? Colors.transparent,
              child: const LoadingSpinner(),
            )
          : child,
    );
  }
}
