import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class FormInputField extends StatelessWidget {
  final String previewText;

  final Function()? onEdit;

  const FormInputField({
    super.key,
    required this.previewText,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: GawTheme.unselectedBackground.withOpacity(0.1),
        border: Border.all(
          color: GawTheme.unselectedBackground,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: PaddingSizes.mainPadding,
          ),
          Expanded(
            child: MainText(
              previewText,
              overflow: TextOverflow.fade,
              softWrap: false,
              color: GawTheme.unselectedText,
            ),
          ),
          InkWell(
            onTap: onEdit,
            child: Container(
              width: 42,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: GawTheme.unselectedBackground,
                  ),
                ),
              ),
              child: const Center(
                child: SvgIcon(
                  PixelPerfectIcons.editNormal,
                  size: 21,
                  color: GawTheme.unselectedText,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
