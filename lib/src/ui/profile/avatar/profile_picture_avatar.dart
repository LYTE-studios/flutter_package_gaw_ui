import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_package_gaw_ui/flutter_package_gaw_ui.dart';
import 'package:flutter_package_gaw_ui/src/utility/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePictureAvatar extends StatelessWidget {
  final Uint8List? bytes;

  final bool canEdit;

  const ProfilePictureAvatar({
    super.key,
    this.bytes,
    this.canEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Container(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: GawTheme.mainTint,
                width: 1,
              ),
            ),
            alignment: Alignment.center,
            child: bytes == null
                ? SvgPicture.asset(
                    'assets/images/core/default_profile_picture.svg',
                    package: kPackageName,
                    fit: BoxFit.fitWidth,
                  )
                : CircleAvatar(
                    foregroundImage: MemoryImage(bytes!),
                  ),
          ),
        ],
      );
    });
  }
}
