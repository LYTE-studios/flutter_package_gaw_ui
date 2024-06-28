import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class TextDownloadButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const TextDownloadButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Row(children: [
          SizedBox(
            height: 32,
            width: 32,
            child: SvgIcon(PixelPerfectIcons.download),
          ),
          const SizedBox(width: PaddingSizes.mainPadding),
          Text(
            text,
            style: TextStyles.mainStyle.copyWith(
              color: Color.fromRGBO(78, 171, 233, 1),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          )
        ]),
      ),
    );
  }
}
