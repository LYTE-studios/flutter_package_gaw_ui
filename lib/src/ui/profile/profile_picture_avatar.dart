import 'package:flutter/material.dart';
import 'package:gaw_ui/gaw_ui.dart';
import 'package:gaw_ui/src/utility/constants.dart';

class ProfilePictureAvatar extends StatelessWidget {
  final String? imageUrl;

  final bool canEdit;

  final bool showCircle;

  final VoidCallback? onEditPressed;

  const ProfilePictureAvatar({
    super.key,
    this.imageUrl,
    this.canEdit = false,
    this.showCircle = false,
    this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double imageSize =
          constraints.maxWidth - (showCircle ? PaddingSizes.mainPadding : 0);
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
              child: SizedBox(
                width: imageSize,
                height: imageSize,
                child: imageUrl == null
                    ? Image.asset(
                        'assets/images/core/default_profile_picture.png',
                        package: kPackageName,
                        fit: BoxFit.fill,
                      )
                    : Image.network(imageUrl!),
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
