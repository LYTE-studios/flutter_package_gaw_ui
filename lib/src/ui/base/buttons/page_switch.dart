import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

class PageSwitch extends StatelessWidget {
  final List<String> pageNames;

  final int selectedIndex;

  final Function(int?)? onChangedIndex;

  const PageSwitch({
    super.key,
    required this.pageNames,
    required this.selectedIndex,
    this.onChangedIndex,
  });

  final double switchPadding = PaddingSizes.extraMiniPadding;

  final double switchFaultMargin = 0.5;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: () {
            HapticFeedback.lightImpact();
            onChangedIndex?.call(selectedIndex == 0 ? 1 : 0);
          },
          child: Container(
            decoration: BoxDecoration(
              color: GawTheme.unselectedBackground,
              borderRadius: BorderRadius.circular(
                19,
              ),
            ),
            height: 42,
            width: constraints.maxWidth,
            child: Padding(
              padding: EdgeInsets.all(
                switchPadding,
              ),
              child: LayoutBuilder(builder: (context, constraints) {
                return Stack(
                  children: [
                    AnimatedAlign(
                      alignment: selectedIndex == 0
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      child: Container(
                        width: constraints.maxWidth / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: GawTheme.clearBackground,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      child: SizedBox(
                        width: constraints.maxWidth / 2,
                        child: Center(
                          child: MainText(
                            pageNames[0],
                            textStyleOverride: TextStyles.titleStyle.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: selectedIndex == 0
                                  ? GawTheme.text
                                  : GawTheme.unselectedText,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      child: SizedBox(
                        width: constraints.maxWidth / 2,
                        child: Center(
                          child: MainText(
                            pageNames[1],
                            textStyleOverride: TextStyles.titleStyle.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: selectedIndex == 1
                                  ? GawTheme.text
                                  : GawTheme.unselectedText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
