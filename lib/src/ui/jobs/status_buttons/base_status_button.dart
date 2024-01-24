import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class BaseStatusButton extends StatelessWidget {
  final String label;

  final Color color;

  final bool loading;

  const BaseStatusButton({
    super.key,
    required this.label,
    required this.color,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: loading
                ? const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      color: GawTheme.mainTintText,
                    ),
                  )
                : MainText(
                    label,
                    textStyleOverride: TextStyles.titleStyle.copyWith(
                      color: GawTheme.clearText,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
          ),
          label == LocaleKeys.applyForJob.tr()
              ? const Positioned(
                  right: 32,
                  top: 14,
                  child: SizedBox(
                    height: 28,
                    width: 28,
                    child: SvgIcon(
                      PixelPerfectIcons.arrowRightCircleMedium,
                      color: GawTheme.clearText,
                    ),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget buttonContent(ctx, bool isApply) {
    //if (!isApply) {
    return MainText(
      label,
      textStyleOverride: TextStyles.titleStyle.copyWith(
        color: GawTheme.clearText,
        fontSize: 18,
        fontWeight: FontWeight.w900,
      ),
    );
    /*} else {
      return Stack(
        alignment: Alignment.center,
        children: [
          /*Positioned(
            right: 0, //MediaQuery.of(ctx).size.width / 4,
            child: const SvgIcon(
              PixelPerfectIcons.arrowRightCircleMedium,
              color: GawTheme.clearText,
            ),
          ),*/
          Text(
            label,
            style: const TextStyle(
              color: GawTheme.clearText, // Text color
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.center,
          )
        ],
      );
    }*/
  }
}
