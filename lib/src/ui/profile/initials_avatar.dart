import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class InitialsAvatar extends StatelessWidget {
  final String initials;

  final String? imageUrl;

  final bool isBlock;

  const InitialsAvatar({
    super.key,
    required this.initials,
    this.imageUrl,
    this.isBlock = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 48,
      ),
      decoration: BoxDecoration(
        color:
            isBlock ? GawTheme.darkBackground : GawTheme.unselectedBackground,
        shape: isBlock ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: BorderRadius.circular(12),
      ),
      child: imageUrl != null
          ? ProfilePictureImageBox(
              imageUrl: imageUrl!,
              initials: initials,
            )
          : InitialsBlock(
              initials: initials,
              color: GawTheme.clearText,
            ),
    );
  }
}

class InitialsBlock extends StatelessWidget {
  final String initials;

  final Color? color;

  const InitialsBlock({
    super.key,
    required this.initials,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MainText(
        initials,
        alignment: TextAlign.center,
        textStyleOverride: TextStyles.titleStyle.copyWith(
          fontSize: 14,
          color: color ?? GawTheme.text,
          overflow: TextOverflow.fade,
        ),
      ),
    );
  }
}
