import 'package:flutter/services.dart' show FontLoader, rootBundle;
import 'package:gaw_ui/src/utility/constants.dart';

class PixelPerfectIcons {
  static const String packageName = kPackageName;

  static const String prefix = 'packages/$kPackageName/assets';

  static const String normalBasePath = '$prefix/icons/pixel_perfect/Normal/SVG';
  static const String mediumBasePath = '$prefix/icons/pixel_perfect/Medium/SVG';
  static const String boldBasePath = '$prefix/icons/pixel_perfect/Bold/SVG';

  static const String customBasePath = '$prefix/icons/custom';

  static List<String> preloads = [
    customAdd,
    customSort,
    customCopy,
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
    netherlands,
    unitedKingdom,
    customEye,
    netherlands,
    unitedKingdom,
    france,
    customNotification,
    customApplicationDocument,
    download,
    chat,
    '$prefix/images/banner/banner_item_1.svg',
    '$prefix/images/banner/banner_item_2.svg',
    '$prefix/images/banner/banner_item_3.svg',
  ];

  static Future<void> loadIcons() async {
    final FontLoader fontLoader = FontLoader('General Sans');

    await fontLoader.load();

    for (String icon in preloads) {
      await rootBundle.load(icon);
    }
  }

  // NAVIGATION

  static const String customUser = '$customBasePath/2 User.svg';

  static const String customAdd = '$customBasePath/add.svg';
  static const String customSort = '$customBasePath/sort.svg';
  static const String customCopy = '$customBasePath/copy.svg';
  static const String customPhone = '$customBasePath/phone.svg';
  static const String customEye = '$customBasePath/view_eye.svg';
  static const String customInApp = '$customBasePath/in_app_notification.svg';
  static const String customPush = '$customBasePath/push_notification.svg';
  static const String customMail = '$customBasePath/email.svg';
  static const String customSend = '$customBasePath/send.svg';
  static const String customApplicationDocument =
      '$customBasePath/application_document.svg';
  static const String customNotification =
      '$customBasePath/custom_notification.svg';

  static const String customUsers = '$customBasePath/users.svg';

  static const String download = '$customBasePath/download.svg';

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
  static const String warningMedium =
      '$mediumBasePath/UI Basic/warning-circle.svg';

  static const String timeDiamondpNormal = '$customBasePath/time-diamond.svg';

  static const String clockNormal = '$normalBasePath/UI Basic/clock.svg';

  static const String settingsNormal =
      '$mediumBasePath/UI Basic/settings-1.svg';

  static const String personMedium = '$customBasePath/person.svg';

  static const String tag = '$customBasePath/tag.svg';

  static const String editNormal = '$normalBasePath/UI Basic/edit.svg';

  static const String arrowRightMedium = '$mediumBasePath/Arrows/Right 13.svg';

  static const String arrowRightCircleMedium =
      '$mediumBasePath/Arrows/Right 10.svg';

  static const String plusMedium = '$mediumBasePath/UI Basic/plus 3.svg';

  static const String warningNormal =
      '$normalBasePath/UI Basic/warning-circle.svg';

  static const String checkNormal = '$normalBasePath/UI Basic/check.svg';

  static const String checkMedium = '$mediumBasePath/UI Basic/check.svg';

  static const String calendarNormal = '$customBasePath/calendar.svg';

  static const String calendarMedium = '$customBasePath/calendar.svg';

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
  static const String xMedium = '$mediumBasePath/UI Basic/cancel.svg';

  static const String barChart = '$customBasePath/bar_chart.svg';

  static const String lineChart = '$customBasePath/line_chart.svg';

  static const String applicationSent = '$customBasePath/application_sent.svg';

  static const String info = '$customBasePath/info.svg';

  static const String emailSent = '$customBasePath/email_sent.svg';

  static const String arrowDown = '$customBasePath/arrow_down.svg';

  static const String emptyNotif = '$customBasePath/notification_empty.svg';

  static const String chooseLibrary = '$customBasePath/choose_library.svg';

  static const String takePhoto = '$customBasePath/take_photo.svg';

  static const String removePicture = '$customBasePath/remove_picture.svg';

  static const String arrowBack = '$customBasePath/arrow_back.svg';

  static const String backArrow = '$customBasePath/back_arrow.svg';

  static const String washers = '$customBasePath/washers.svg';

  static const String roundedPinpointer =
      '$customBasePath/rounded_pinpointer.svg';

  static const String dropPin = '$customBasePath/drop_pin.svg';

  static const String upload = '$customBasePath/upload.svg';

  static const String netherlands = '$customBasePath/netherlands.svg';

  static const String unitedKingdom = '$customBasePath/united_kingdom.svg';
  static const String france = '$customBasePath/france.svg';

  static const String chat = '$customBasePath/chat.svg';

  static const String folderUpdate = '$customBasePath/folder_update.svg';
  static const String passwordChange = '$customBasePath/password_change.svg';
  static const String registrationComplete =
      '$customBasePath/registration_complete.svg';
}
