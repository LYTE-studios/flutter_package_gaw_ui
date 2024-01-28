import 'package:flutter/material.dart';

import '../../../../gaw_ui.dart';

class NotificationIcon extends StatelessWidget {
  final bool openNotifications;

  final double size;

  const NotificationIcon({
    super.key,
    this.openNotifications = false,
    this.size = 18,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          const SvgIcon(
            PixelPerfectIcons.bellMedium,
            color: GawTheme.clearBackground,
          ),
          Positioned(
            top: 0,
            right: size / 4,
            child: Visibility(
              visible: openNotifications,
              child: Container(
                height: size / 2,
                width: size / 2,
                decoration: const BoxDecoration(
                  color: GawTheme.success,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
