import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/utility/constants.dart';

class ProfilePictureAvatar extends StatelessWidget {
  final String? imageUrl;
  final Uint8List? bytes;

  final bool canEdit;
  final bool canRemove;

  final bool showCircle;

  final VoidCallback? onEditPressed;
  final VoidCallback? onRemovePressed;

  const ProfilePictureAvatar({
    super.key,
    this.imageUrl,
    this.bytes,
    this.canEdit = false,
    this.canRemove = false,
    this.showCircle = false,
    this.onEditPressed,
    this.onRemovePressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double imageSize =
          constraints.maxWidth - (showCircle ? PaddingSizes.bigPadding : 0);
      return Container(
        height: constraints.maxHeight,
        width: constraints.maxWidth,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: GawTheme.clearBackground,
          border: !showCircle
              ? null
              : Border.fromBorderSide(
                  Borders.mainSide.copyWith(
                    color: GawTheme.mainTint,
                  ),
                ),
        ),
        child: Stack(
          children: [
            Center(
              child: ClipOval(
                child: SizedBox(
                  height: imageSize,
                  width: imageSize,
                  child: imageUrl == null && bytes == null
                      ? Image.asset(
                          'assets/images/core/default_profile_picture.png',
                          package: kPackageName,
                          fit: BoxFit.fill,
                        )
                      : ProfilePictureImageBox(
                          imageUrl: imageUrl,
                          bytes: bytes,
                        ),
                ),
              ),
            ),
            if (canRemove)
              Positioned(
                top: 0,
                right: 0,
                child: ColorlessInkWell(
                  onTap: onRemovePressed,
                  child: Container(
                    decoration: BoxDecoration(
                      color: GawTheme.clearText,
                      // Change as needed for your theme
                      shape: BoxShape.circle,
                      border: Border.all(
                        color:
                            !showCircle ? Colors.transparent : GawTheme.error,
                        // Change as needed for your theme
                        width: 1,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(
                        PaddingSizes.smallPadding,
                      ),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: SvgIcon(
                          PixelPerfectIcons.trashMedium,
                          color: GawTheme.error,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (canEdit) // Show the edit button only if canEdit is true
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: GawTheme.clearText,
                    // Change as needed for your theme
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:
                          !showCircle ? Colors.transparent : GawTheme.mainTint,
                      // Change as needed for your theme
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    iconSize: 24, // Change as needed
                    icon: const Icon(
                      Icons.edit, // Change the icon if needed
                      color:
                          GawTheme.mainTint, // Change as needed for your theme
                    ),
                    onPressed: onEditPressed,
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }
}

class ProfilePictureImageBox extends StatelessWidget {
  final String? imageUrl;

  final Uint8List? bytes;

  final String? initials;

  const ProfilePictureImageBox({
    super.key,
    required this.imageUrl,
    this.bytes,
    this.initials,
  });

  @override
  Widget build(BuildContext context) {
    if (bytes != null) {
      return Image.memory(
        bytes!,
        fit: BoxFit.cover,
      );
    }

    return Image.network(
      imageUrl!,
      errorBuilder: (context, object, error) {
        if (initials != null) {
          return InitialsBlock(
            initials: initials!,
            color: GawTheme.clearText,
          );
        }

        return Image.asset(
          'assets/images/core/default_profile_picture.png',
          package: kPackageName,
          fit: BoxFit.cover,
        );
      },
      fit: BoxFit.cover,
    );
  }
}
