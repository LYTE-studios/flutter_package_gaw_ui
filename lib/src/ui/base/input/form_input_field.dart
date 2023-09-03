import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';

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
          MainText(
            previewText,
            overflow: TextOverflow.fade,
            color: GawTheme.unselectedText,
          ),
          const Spacer(),
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
