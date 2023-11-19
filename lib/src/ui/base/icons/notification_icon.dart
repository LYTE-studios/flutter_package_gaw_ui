import 'package:flutter/material.dart';

import '../../../../flutter_package_gaw_ui.dart';

class NotificationIcon extends StatelessWidget {
  final bool openNotifications;

  const NotificationIcon({
    super.key,
    this.openNotifications = false,
  });

  @override
  Widget build(BuildContext context) {
    return SvgIcon(
      openNotifications
          ? PixelPerfectIcons.openNotificationMedium
          : PixelPerfectIcons.notificationMedium,
      color: GawTheme.clearBackground,
    );
  }
}
