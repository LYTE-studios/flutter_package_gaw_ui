import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class InfoRow extends StatelessWidget {
  final Widget leading;

  final String first;

  final String last;

  const InfoRow({
    super.key,
    required this.leading,
    required this.first,
    required this.last,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: PaddingSizes.smallPadding,
        bottom: PaddingSizes.extraSmallPadding,
        left: PaddingSizes.extraSmallPadding,
      ),
      child: Row(
        children: [
          leading,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: PaddingSizes.mainPadding,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: Borders.mainSide,
                  ),
                ),
                child: RichText(
                  text: TextSpan(
                    text: '$first  ',
                    style: TextStyles.mainStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      color: GawTheme.text,
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: last,
                        style: TextStyles.mainStyle.copyWith(
                          color: GawTheme.unselectedText,
                          fontWeight: FontWeight.w200,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
