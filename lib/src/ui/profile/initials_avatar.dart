import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class InitialsAvatar extends StatefulWidget {
  final String initials;

  final String? imageUrl;

  const InitialsAvatar({
    super.key,
    required this.initials,
    this.imageUrl,
  });

  @override
  State<InitialsAvatar> createState() => _InitialsAvatarState();
}

class _InitialsAvatarState extends State<InitialsAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 48,
      ),
      decoration: BoxDecoration(
        color: GawTheme.unselectedBackground,
        shape: BoxShape.circle,
      ),
      child: widget.imageUrl != null
          ? Image.network(
              widget.imageUrl!,
              fit: BoxFit.fill,
            )
          : Center(
              child: MainText(
                widget.initials,
                alignment: TextAlign.center,
                textStyleOverride: TextStyles.titleStyle.copyWith(
                  fontSize: 14,
                  color: GawTheme.text,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
    );
  }
}
