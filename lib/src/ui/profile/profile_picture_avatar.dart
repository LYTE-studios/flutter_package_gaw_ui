import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';

class ProfilePictureAvatar extends StatelessWidget {
  final Uint8List? bytes;

  final bool canEdit;

  final bool showCircle;

  final VoidCallback? onEditPressed;

  const ProfilePictureAvatar({
    super.key,
    this.bytes,
    this.canEdit = false,
    this.showCircle = false,
    this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double imageSize = constraints.maxWidth - (showCircle ? 2 : 0);
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: showCircle
                  ? Border.all(
                      color: GawTheme.mainTint,
                      width: 1,
                    )
                  : null,
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(
                PaddingSizes.smallPadding,
              ),
              child: bytes == null
                  ? const SvgIcon(
                      PixelPerfectIcons.profilePicture,
                      fit: BoxFit.fill,
                      color: GawTheme.unselectedBackground,
                    )
                  : CircleAvatar(
                      radius: imageSize / 2,
                      foregroundImage: MemoryImage(bytes!),
                    ),
            ),
          ),
          if (canEdit) // Show the edit button only if canEdit is true
            Positioned(
              right: 0, // Adjust the position as needed
              bottom: 0, // Adjust the position as needed
              child: Container(
                alignment: Alignment.center,
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: GawTheme.clearBackground,
                  // Change as needed for your theme
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: GawTheme.mainTint, // Change as needed for your theme
                    width: 1,
                  ),
                ),
                child: IconButton(
                  iconSize: 24, // Change as needed
                  icon: const Icon(
                    Icons.edit, // Change the icon if needed
                    color: GawTheme.mainTint, // Change as needed for your theme
                  ),
                  onPressed: onEditPressed,
                ),
              ),
            ),
        ],
      );
    });
  }
}
