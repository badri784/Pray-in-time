// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Pray in Time';

  @override
  String get routeNotFound => 'Page not found. Please try again.';

  @override
  String get loading => 'Loading...';

  @override
  String get okButton => 'OK';

  @override
  String get comingSoon => 'Coming Soon...';

  @override
  String get retryAgain => 'Try Again';

  @override
  String get onboardingNotificationTitle => 'Never Miss A Prayer';

  @override
  String get onboardingNotificationSubtitle =>
      'Allow notifications to wake up your screen and\nhear the beautiful Adhan at prayer times';

  @override
  String get allowNotificationsButton => 'Allow Notifications';

  @override
  String notificationPermissionError(String error) {
    return 'Notification permission error: $error';
  }

  @override
  String get onboardingLocationTitle => 'Accurate Prayer Times';

  @override
  String get onboardingLocationSubtitle =>
      'Please allow location access to calculate exact\nprayer times for your city';

  @override
  String get enableLocationButton => 'Enable Location Access';

  @override
  String get detectedLocation => 'Detected Location';

  @override
  String get loadingPrayer => 'Loading prayer...';

  @override
  String get loadingPrayerTimes => 'Loading prayer times...';

  @override
  String get noPrayerTimesFound => 'No prayer times found';

  @override
  String nextPrayerLabel(String prayer) {
    return 'Next Prayer: $prayer';
  }

  @override
  String get prayerAt => 'Prayer at ';

  @override
  String get mandatoryAlarmActive => 'Mandatory Alarm Active';

  @override
  String get dailyPrayerSchedule => 'DAILY PRAYER SCHEDULE';

  @override
  String get comingUpNext => 'COMING UP NEXT';

  @override
  String get alarmsArmed => '.. Alarms Armed';

  @override
  String get prayerFajr => 'Fajr';

  @override
  String get prayerSunrise => 'Sunrise';

  @override
  String get prayerDhuhr => 'Dhuhr';

  @override
  String get prayerAsr => 'Asr';

  @override
  String get prayerMaghrib => 'Maghrib';

  @override
  String get prayerIsha => 'Isha';

  @override
  String get prayerGeneral => 'Prayer';

  @override
  String get adhanChannelName => 'Adhan Notifications';

  @override
  String get adhanChannelDesc => 'Adhan and prayer time alerts channel';

  @override
  String adhanNotificationTitle(String prayer) {
    return 'It\'s time for $prayer prayer';
  }

  @override
  String get adhanNotificationBody => 'Come to Prayer 🕌';

  @override
  String get errorLocationDisabled =>
      'Location services are disabled. Please turn on GPS.';

  @override
  String get errorLocationDenied =>
      'Location permission denied. Please grant location access.';

  @override
  String get errorLocationPermanentlyDenied =>
      'Location permission is permanently denied. Please enable it in device settings.';

  @override
  String get errorLoadCityName => 'Failed to detect city name.';

  @override
  String get errorLoadPrayerTimes =>
      'Failed to load prayer times. Please try again.';

  @override
  String get unknownLocation => 'Unknown Location';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get alarmAndNotificationSection => 'ALARM & NOTIFICATION';

  @override
  String get adhanSounds => 'Adhan Sounds';

  @override
  String get defaultOption => 'Default';

  @override
  String get locationSection => 'LOCATION';

  @override
  String get currentLocation => 'Current Location';

  @override
  String get cityNotFound => 'City Not Found';

  @override
  String autoDetectSubtitle(String city) {
    return '$city,\nAuto Detect';
  }

  @override
  String get languageSection => 'LANGUAGE';

  @override
  String get languageTileTitle => 'App Language (English)';

  @override
  String get languageTileSubtitle => 'Switch to change language to Arabic';

  @override
  String get supportAndInfoSection => 'SUPPORT & INFO';

  @override
  String get contactUs => 'Contact Us';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get aboutAndRateUs => 'About & Rate Us';

  @override
  String get versionNumber => 'v1.0.0';

  @override
  String get developerName => 'Ahmed Salah';

  @override
  String get developerRole => 'Software Engineer • Pray in Time';

  @override
  String get developerBio =>
      'Have questions, feedback, or need help? Feel free to reach out anytime.';

  @override
  String get getInTouchSection => 'GET IN TOUCH';

  @override
  String get callDirectly => 'Call Directly';

  @override
  String get copyPhoneTooltip => 'Copy Phone';

  @override
  String get callTooltip => 'Call';

  @override
  String get whatsappTitle => 'WhatsApp';

  @override
  String whatsappSubtitle(String phone) {
    return 'Chat on $phone';
  }

  @override
  String get chatAction => 'Chat';

  @override
  String get sendEmailTitle => 'Send an Email';

  @override
  String get copyEmailTooltip => 'Copy Email';

  @override
  String get composeTooltip => 'Compose';

  @override
  String get linkedinTitle => 'LinkedIn Profile';

  @override
  String get connectAction => 'Connect';

  @override
  String get sendQuickMessageSection => 'SEND A QUICK MESSAGE';

  @override
  String get subjectHint => 'Subject (e.g. Suggestion, Issue, Feedback)';

  @override
  String get messageHint => 'Type your message here...';

  @override
  String sendToEmail(String email) {
    return 'Send to $email';
  }

  @override
  String get contactReplyTime => 'We usually reply within 24 hours';

  @override
  String get couldNotLaunchAction =>
      'Could not launch action. Please try again.';

  @override
  String get whatsappDefaultMessage =>
      'Assalamu Alaikum Ahmed,\nI\'m contacting you regarding the Pray in Time app.';

  @override
  String get emailDefaultSubject => 'Pray in Time Support & Feedback';

  @override
  String get emailFeedbackSubject => 'Pray in Time Feedback';

  @override
  String get phoneNumberLabel => 'Phone number';

  @override
  String get emailAddressLabel => 'Email address';

  @override
  String copiedToClipboard(String label) {
    return '$label copied to clipboard';
  }

  @override
  String get privacyEmailSubject => 'Pray in Time - Privacy Inquiry';

  @override
  String get privacyShieldTitle => 'Your Privacy is Sacred';

  @override
  String get privacyShieldDesc =>
      'Pray in Time operates completely on-device without tracking, ads, or external data collection.';

  @override
  String get privacyBadgeOffline => 'Offline Ready';

  @override
  String get privacyBadgeNoAccounts => 'No Accounts';

  @override
  String get privacyBadgeZeroAds => 'Zero Ads';

  @override
  String get privacyOverviewTitle => 'Overview';

  @override
  String get privacyOverviewContent =>
      'Welcome to Pray in Time. Your privacy is of paramount importance to us. This Privacy Policy explains how our application handles your information. In short: Pray in Time is built on a privacy-first, on-device architecture. We do not operate external servers, and we never collect, sell, or share your personal data.';

  @override
  String get privacyLocationTitle => 'Location Data & City Detection';

  @override
  String get privacyLocationContent =>
      'To calculate accurate Islamic prayer times (Fajr, Sunrise, Dhuhr, Asr, Maghrib, and Isha) for your region, the application requests foreground access to your device\'s location.\n\n• On-Device Calculation: Your GPS coordinates are processed locally using astronomical algorithms and cached on your device for instant offline access.\n• City Name Display: Your device\'s built-in OS geocoder is used to display your city/region name in the app and save it locally.\n• No Background Location Tracking: Location is never tracked in the background or sent to our own servers.';

  @override
  String get privacyAlarmsTitle => 'Alarms & Foreground Adhan Audio';

  @override
  String get privacyAlarmsContent =>
      'Pray in Time schedules prayer alarms up to 14 days ahead directly on your device so you never miss a prayer—even when the app is closed.\n\n• Native Exact Alarms: Scheduled locally through Android AlarmManager (AlarmClock) with automatic restoration after device restarts.\n• Foreground Audio Service: When prayer time enters, a temporary foreground media service runs solely to play the full Adhan audio and display a \"Stop Adhan\" notification control, then stops automatically.\n• Zero Push Servers: No cloud push services or external servers are used to trigger alerts.';

  @override
  String get privacyStorageTitle => 'Preferences & Local Storage';

  @override
  String get privacyStorageContent =>
      'Data such as your onboarding status, app language, last detected coordinates, city name, scheduled local alarm times, calculation method, and juristic preferences are stored strictly on your device via SharedPreferences.\n\n• No user account or sign-up is required.\n• All locally stored data is permanently erased whenever you clear app data or uninstall the app.';

  @override
  String get privacyThirdPartyTitle => 'Third-Party Services & Tracking';

  @override
  String get privacyThirdPartyContent =>
      'Pray in Time does NOT include third-party analytics SDKs, advertising networks, or data brokers. We do not track your behavior, device identifiers, or usage habits.';

  @override
  String get permissionsUsedHeader => 'PERMISSIONS USED';

  @override
  String get permLocationTitle => 'Location (Foreground GPS)';

  @override
  String get permLocationDesc =>
      'Used to calculate prayer schedules locally and detect your city name.';

  @override
  String get permNotificationsTitle => 'Notifications';

  @override
  String get permNotificationsDesc =>
      'Alerts you when prayer time enters and provides the \"Stop Adhan\" button.';

  @override
  String get permExactAlarmsTitle => 'Exact Alarms';

  @override
  String get permExactAlarmsDesc =>
      'Triggers Adhan alarms accurately down to the second, even in Doze mode.';

  @override
  String get permForegroundMediaTitle =>
      'Foreground Media Playback & Wake Lock';

  @override
  String get permForegroundMediaDesc =>
      'Plays the full Adhan audio reliably when the screen is locked or the app is closed.';

  @override
  String get permBootTitle => 'Boot Completed';

  @override
  String get permBootDesc =>
      'Automatically restores your scheduled local prayer alarms after a phone restart.';

  @override
  String get privacyQuestionsTitle => 'Have Questions About Privacy?';

  @override
  String get privacyQuestionsDesc =>
      'If you have any questions or suggestions regarding this privacy policy, we are glad to assist.';

  @override
  String privacyEmailButton(String email) {
    return 'Email: $email';
  }

  @override
  String get privacyFooterVersion => 'Pray in Time • Version 1.0.0';

  @override
  String get privacyLastUpdated => 'Last Updated: November 2026';
}
