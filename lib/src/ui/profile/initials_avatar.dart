import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/ui/base/text/auto_sized_text.dart';

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
    return isBlock
        ? ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 48,
              ),
              decoration: const BoxDecoration(
                color: GawTheme.darkBackground,
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
            ),
          )
        : ClipOval(
            child: Container(
              constraints: const BoxConstraints(
                minHeight: 48,
              ),
              decoration: const BoxDecoration(
                color: GawTheme.darkBackground,
                shape: BoxShape.circle,
              ),
              child: imageUrl != null
                  ? ProfilePictureImageBox(
                      imageUrl: imageUrl!,
                    )
                  : InitialsBlock(
                      initials: initials,
                    ),
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
      child: Padding(
        padding: const EdgeInsets.all(
          PaddingSizes.mainPadding,
        ),
        child: AutoSizedText(
          initials,
          softWrap: true,
          alignment: TextAlign.center,
          textStyleOverride: TextStyles.titleStyle.copyWith(
            fontSize: 16,
            color: color ?? GawTheme.clearText,
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    );
  }
}
