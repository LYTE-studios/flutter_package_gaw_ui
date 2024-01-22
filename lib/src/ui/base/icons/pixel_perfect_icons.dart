import 'package:flutter/services.dart' show rootBundle;
import 'package:gaw_ui/src/utility/constants.dart';

class PixelPerfectIcons {
  static const String normalBasePath = 'assets/icons/pixel_perfect/Normal/SVG';
  static const String mediumBasePath = 'assets/icons/pixel_perfect/Medium/SVG';
  static const String boldBasePath = 'assets/icons/pixel_perfect/Bold/SVG';

  static const String customBasePath = 'assets/icons/custom';

  static List<String> preloads = [
    profilePicture,
    logoutMedium,
    bellMedium,
    workMedium,
    notificationMedium,
    openNotificationMedium,
    homeNormal,
    statisticsNormal,
    waterDripNormal,
    timeDiamondpNormal,
    clockNormal,
    settingsNormal,
    personMedium,
    editNormal,
    arrowRightMedium,
    arrowRightCircleMedium,
    plusMedium,
    warningNormal,
    checkNormal,
    checkMedium,
    calendarNormal,
    leftArrowNormal,
    doorMedium,
    zoomMedium,
    trashMedium,
    timeIndicator,
    placeIndicator,
    flagMedium,
    eyeHideNormal,
    eyeNormal,
    documentNormal,
    xNormal,
    barChart,
    lineChart,
    applicationSent,
    emailSent,
    arrowDown,
    emptyNotif,
    chooseLibrary,
    takePhoto,
    removePicture,
    arrowBack,
    washers,
    upload,
  ];

  static String resolvePackageName(String path) {
    return 'packages/$kPackageName/$path';
  }

  static Future<void> loadIcons() async {
    List<Future> futures = [];
    for (String icon in preloads) {
      futures.add(
        Future(
          () => rootBundle.load(resolvePackageName(icon)),
        ),
      );
    }
    await Future.wait(futures);
  }

  // NAVIGATION

  static const String profilePicture =
      '$customBasePath/default_profile_picture.svg';
  static const String sentMedium = '$customBasePath/sent.svg';

  static const String logoutMedium = '$customBasePath/logout.svg';

  static const String bellMedium = '$customBasePath/bell.svg';

  static const String workMedium = '$customBasePath/work.svg';

  static const String notificationMedium = '$customBasePath/notification.svg';

  static const String openNotificationMedium =
      '$customBasePath/open-notification.svg';

  static const String homeNormal = '$mediumBasePath/UI Basic/home 8.svg';

  static const String statisticsNormal =
      '$mediumBasePath/Arrows/Trend Up 4.svg';

  static const String waterDripNormal = '$customBasePath/water_drip.svg';

  static const String timeDiamondpNormal = '$customBasePath/time-diamond.svg';

  static const String clockNormal = '$normalBasePath/UI Basic/clock.svg';

  static const String settingsNormal =
      '$mediumBasePath/UI Basic/settings-1.svg';

  static const String personMedium = '$mediumBasePath/UI Basic/profile.svg';

  static const String editNormal = '$normalBasePath/UI Basic/edit.svg';

  static const String arrowRightMedium = '$mediumBasePath/Arrows/Right 13.svg';

  static const String arrowRightCircleMedium =
      '$mediumBasePath/Arrows/Right 10.svg';

  static const String plusMedium = '$mediumBasePath/UI Basic/plus 3.svg';

  static const String warningNormal =
      '$normalBasePath/UI Basic/warning-circle.svg';

  static const String checkNormal = '$normalBasePath/UI Basic/check.svg';

  static const String checkMedium = '$mediumBasePath/UI Basic/check.svg';

  static const String calendarNormal = '$normalBasePath/UI Basic/calendar.svg';

  static const String calendarMedium = '$mediumBasePath/UI Basic/calendar.svg';

  static const String leftArrowNormal = '$mediumBasePath/Arrows/Left 16.svg';

  static const String doorMedium = '$mediumBasePath/UI Basic/home 8.svg';

  static const String zoomMedium = '$mediumBasePath/UI Basic/search 3.svg';

  static const String trashMedium = '$mediumBasePath/UI Basic/delete 4.svg';

  static const String timeIndicator = '$customBasePath/time-indicator.svg';

  static const String placeIndicator = '$customBasePath/place-indicator.svg';

  static const String flagMedium = '$customBasePath/destination-flag.svg';

  static const String eyeHideNormal = '$normalBasePath/UI Basic/eye-hide-2.svg';

  static const String eyeNormal = '$normalBasePath/UI Basic/eye-hide.svg';

  static const String documentNormal = '$normalBasePath/UI Basic/document.svg';

  static const String xNormal = '$normalBasePath/UI Basic/cancel.svg';

  static const String barChart = '$customBasePath/bar_chart.svg';

  static const String lineChart = '$customBasePath/line_chart.svg';

  static const String applicationSent = '$customBasePath/application_sent.svg';

  static const String emailSent = '$customBasePath/email_sent.svg';

  static const String arrowDown = '$customBasePath/arrow_down.svg';

  static const String emptyNotif = '$customBasePath/notification_empty.svg';

  static const String chooseLibrary = '$customBasePath/choose_library.svg';

  static const String takePhoto = '$customBasePath/take_photo.svg';

  static const String removePicture = '$customBasePath/remove_picture.svg';

  static const String arrowBack = '$customBasePath/arrow_back.svg';

  static const String washers = '$customBasePath/washers.svg';

  static const String roundedPinpointer =
      '$customBasePath/rounded_pinpointer.svg';

  static const String dropPin = '$customBasePath/drop_pin.svg';

  static const String upload = '$customBasePath/upload.svg';
}
