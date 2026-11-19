import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Pray in Time'**
  String get appTitle;

  /// No description provided for @routeNotFound.
  ///
  /// In en, this message translates to:
  /// **'Page not found. Please try again.'**
  String get routeNotFound;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @okButton.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get okButton;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon...'**
  String get comingSoon;

  /// No description provided for @retryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get retryAgain;

  /// No description provided for @onboardingNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Never Miss A Prayer'**
  String get onboardingNotificationTitle;

  /// No description provided for @onboardingNotificationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Allow notifications to wake up your screen and\nhear the beautiful Adhan at prayer times'**
  String get onboardingNotificationSubtitle;

  /// No description provided for @allowNotificationsButton.
  ///
  /// In en, this message translates to:
  /// **'Allow Notifications'**
  String get allowNotificationsButton;

  /// No description provided for @notificationPermissionError.
  ///
  /// In en, this message translates to:
  /// **'Notification permission error: {error}'**
  String notificationPermissionError(String error);

  /// No description provided for @onboardingLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Accurate Prayer Times'**
  String get onboardingLocationTitle;

  /// No description provided for @onboardingLocationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please allow location access to calculate exact\nprayer times for your city'**
  String get onboardingLocationSubtitle;

  /// No description provided for @enableLocationButton.
  ///
  /// In en, this message translates to:
  /// **'Enable Location Access'**
  String get enableLocationButton;

  /// No description provided for @detectedLocation.
  ///
  /// In en, this message translates to:
  /// **'Detected Location'**
  String get detectedLocation;

  /// No description provided for @loadingPrayer.
  ///
  /// In en, this message translates to:
  /// **'Loading prayer...'**
  String get loadingPrayer;

  /// No description provided for @loadingPrayerTimes.
  ///
  /// In en, this message translates to:
  /// **'Loading prayer times...'**
  String get loadingPrayerTimes;

  /// No description provided for @noPrayerTimesFound.
  ///
  /// In en, this message translates to:
  /// **'No prayer times found'**
  String get noPrayerTimesFound;

  /// No description provided for @nextPrayerLabel.
  ///
  /// In en, this message translates to:
  /// **'Next Prayer: {prayer}'**
  String nextPrayerLabel(String prayer);

  /// No description provided for @prayerAt.
  ///
  /// In en, this message translates to:
  /// **'Prayer at '**
  String get prayerAt;

  /// No description provided for @mandatoryAlarmActive.
  ///
  /// In en, this message translates to:
  /// **'Mandatory Alarm Active'**
  String get mandatoryAlarmActive;

  /// No description provided for @dailyPrayerSchedule.
  ///
  /// In en, this message translates to:
  /// **'DAILY PRAYER SCHEDULE'**
  String get dailyPrayerSchedule;

  /// No description provided for @comingUpNext.
  ///
  /// In en, this message translates to:
  /// **'COMING UP NEXT'**
  String get comingUpNext;

  /// No description provided for @alarmsArmed.
  ///
  /// In en, this message translates to:
  /// **'.. Alarms Armed'**
  String get alarmsArmed;

  /// No description provided for @prayerFajr.
  ///
  /// In en, this message translates to:
  /// **'Fajr'**
  String get prayerFajr;

  /// No description provided for @prayerSunrise.
  ///
  /// In en, this message translates to:
  /// **'Sunrise'**
  String get prayerSunrise;

  /// No description provided for @prayerDhuhr.
  ///
  /// In en, this message translates to:
  /// **'Dhuhr'**
  String get prayerDhuhr;

  /// No description provided for @prayerAsr.
  ///
  /// In en, this message translates to:
  /// **'Asr'**
  String get prayerAsr;

  /// No description provided for @prayerMaghrib.
  ///
  /// In en, this message translates to:
  /// **'Maghrib'**
  String get prayerMaghrib;

  /// No description provided for @prayerIsha.
  ///
  /// In en, this message translates to:
  /// **'Isha'**
  String get prayerIsha;

  /// No description provided for @prayerGeneral.
  ///
  /// In en, this message translates to:
  /// **'Prayer'**
  String get prayerGeneral;

  /// No description provided for @adhanChannelName.
  ///
  /// In en, this message translates to:
  /// **'Adhan Notifications'**
  String get adhanChannelName;

  /// No description provided for @adhanChannelDesc.
  ///
  /// In en, this message translates to:
  /// **'Adhan and prayer time alerts channel'**
  String get adhanChannelDesc;

  /// No description provided for @adhanNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'It\'s time for {prayer} prayer'**
  String adhanNotificationTitle(String prayer);

  /// No description provided for @adhanNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'Come to Prayer 🕌'**
  String get adhanNotificationBody;

  /// No description provided for @errorLocationDisabled.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled. Please turn on GPS.'**
  String get errorLocationDisabled;

  /// No description provided for @errorLocationDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission denied. Please grant location access.'**
  String get errorLocationDenied;

  /// No description provided for @errorLocationPermanentlyDenied.
  ///
  /// In en, this message translates to:
  /// **'Location permission is permanently denied. Please enable it in device settings.'**
  String get errorLocationPermanentlyDenied;

  /// No description provided for @errorLoadCityName.
  ///
  /// In en, this message translates to:
  /// **'Failed to detect city name.'**
  String get errorLoadCityName;

  /// No description provided for @errorLoadPrayerTimes.
  ///
  /// In en, this message translates to:
  /// **'Failed to load prayer times. Please try again.'**
  String get errorLoadPrayerTimes;

  /// No description provided for @unknownLocation.
  ///
  /// In en, this message translates to:
  /// **'Unknown Location'**
  String get unknownLocation;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @alarmAndNotificationSection.
  ///
  /// In en, this message translates to:
  /// **'ALARM & NOTIFICATION'**
  String get alarmAndNotificationSection;

  /// No description provided for @adhanSounds.
  ///
  /// In en, this message translates to:
  /// **'Adhan Sounds'**
  String get adhanSounds;

  /// No description provided for @defaultOption.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultOption;

  /// No description provided for @restartPrayerTimeTitle.
  ///
  /// In en, this message translates to:
  /// **'Refresh Prayer Times'**
  String get restartPrayerTimeTitle;

  /// No description provided for @restartPrayerTimeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tap to refresh location & reschedule alarms'**
  String get restartPrayerTimeSubtitle;

  /// No description provided for @prayerTimesRefreshed.
  ///
  /// In en, this message translates to:
  /// **'Prayer times updated successfully'**
  String get prayerTimesRefreshed;

  /// No description provided for @refreshingPrayerTimes.
  ///
  /// In en, this message translates to:
  /// **'Updating prayer times & alarms...'**
  String get refreshingPrayerTimes;

  /// No description provided for @changingLanguage.
  ///
  /// In en, this message translates to:
  /// **'Updating language...'**
  String get changingLanguage;

  /// No description provided for @locationSection.
  ///
  /// In en, this message translates to:
  /// **'LOCATION'**
  String get locationSection;

  /// No description provided for @currentLocation.
  ///
  /// In en, this message translates to:
  /// **'Current Location'**
  String get currentLocation;

  /// No description provided for @cityNotFound.
  ///
  /// In en, this message translates to:
  /// **'City Not Found'**
  String get cityNotFound;

  /// No description provided for @autoDetectSubtitle.
  ///
  /// In en, this message translates to:
  /// **'{city},\nAuto Detect'**
  String autoDetectSubtitle(String city);

  /// No description provided for @languageSection.
  ///
  /// In en, this message translates to:
  /// **'LANGUAGE'**
  String get languageSection;

  /// No description provided for @languageTileTitle.
  ///
  /// In en, this message translates to:
  /// **'App Language (English)'**
  String get languageTileTitle;

  /// No description provided for @languageTileSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Switch to change language to Arabic'**
  String get languageTileSubtitle;

  /// No description provided for @supportAndInfoSection.
  ///
  /// In en, this message translates to:
  /// **'SUPPORT & INFO'**
  String get supportAndInfoSection;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @aboutAndRateUs.
  ///
  /// In en, this message translates to:
  /// **'About & Rate Us'**
  String get aboutAndRateUs;

  /// No description provided for @versionNumber.
  ///
  /// In en, this message translates to:
  /// **'v1.0.0'**
  String get versionNumber;

  /// No description provided for @developerName.
  ///
  /// In en, this message translates to:
  /// **'Ahmed Salah'**
  String get developerName;

  /// No description provided for @developerRole.
  ///
  /// In en, this message translates to:
  /// **'Software Engineer • Pray in Time'**
  String get developerRole;

  /// No description provided for @developerBio.
  ///
  /// In en, this message translates to:
  /// **'Have questions, feedback, or need help? Feel free to reach out anytime.'**
  String get developerBio;

  /// No description provided for @getInTouchSection.
  ///
  /// In en, this message translates to:
  /// **'GET IN TOUCH'**
  String get getInTouchSection;

  /// No description provided for @callDirectly.
  ///
  /// In en, this message translates to:
  /// **'Call Directly'**
  String get callDirectly;

  /// No description provided for @copyPhoneTooltip.
  ///
  /// In en, this message translates to:
  /// **'Copy Phone'**
  String get copyPhoneTooltip;

  /// No description provided for @callTooltip.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get callTooltip;

  /// No description provided for @whatsappTitle.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get whatsappTitle;

  /// No description provided for @whatsappSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Chat on {phone}'**
  String whatsappSubtitle(String phone);

  /// No description provided for @chatAction.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chatAction;

  /// No description provided for @sendEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Send an Email'**
  String get sendEmailTitle;

  /// No description provided for @copyEmailTooltip.
  ///
  /// In en, this message translates to:
  /// **'Copy Email'**
  String get copyEmailTooltip;

  /// No description provided for @composeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Compose'**
  String get composeTooltip;

  /// No description provided for @linkedinTitle.
  ///
  /// In en, this message translates to:
  /// **'LinkedIn Profile'**
  String get linkedinTitle;

  /// No description provided for @connectAction.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connectAction;

  /// No description provided for @sendQuickMessageSection.
  ///
  /// In en, this message translates to:
  /// **'SEND A QUICK MESSAGE'**
  String get sendQuickMessageSection;

  /// No description provided for @subjectHint.
  ///
  /// In en, this message translates to:
  /// **'Subject (e.g. Suggestion, Issue, Feedback)'**
  String get subjectHint;

  /// No description provided for @messageHint.
  ///
  /// In en, this message translates to:
  /// **'Type your message here...'**
  String get messageHint;

  /// No description provided for @sendToEmail.
  ///
  /// In en, this message translates to:
  /// **'Send to {email}'**
  String sendToEmail(String email);

  /// No description provided for @contactReplyTime.
  ///
  /// In en, this message translates to:
  /// **'We usually reply within 24 hours'**
  String get contactReplyTime;

  /// No description provided for @couldNotLaunchAction.
  ///
  /// In en, this message translates to:
  /// **'Could not launch action. Please try again.'**
  String get couldNotLaunchAction;

  /// No description provided for @whatsappDefaultMessage.
  ///
  /// In en, this message translates to:
  /// **'Assalamu Alaikum Ahmed,\nI\'m contacting you regarding the Pray in Time app.'**
  String get whatsappDefaultMessage;

  /// No description provided for @emailDefaultSubject.
  ///
  /// In en, this message translates to:
  /// **'Pray in Time Support & Feedback'**
  String get emailDefaultSubject;

  /// No description provided for @emailFeedbackSubject.
  ///
  /// In en, this message translates to:
  /// **'Pray in Time Feedback'**
  String get emailFeedbackSubject;

  /// No description provided for @phoneNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumberLabel;

  /// No description provided for @emailAddressLabel.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get emailAddressLabel;

  /// No description provided for @copiedToClipboard.
  ///
  /// In en, this message translates to:
  /// **'{label} copied to clipboard'**
  String copiedToClipboard(String label);

  /// No description provided for @privacyEmailSubject.
  ///
  /// In en, this message translates to:
  /// **'Pray in Time - Privacy Inquiry'**
  String get privacyEmailSubject;

  /// No description provided for @privacyShieldTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Privacy is Sacred'**
  String get privacyShieldTitle;

  /// No description provided for @privacyShieldDesc.
  ///
  /// In en, this message translates to:
  /// **'Pray in Time operates completely on-device without tracking, ads, or external data collection.'**
  String get privacyShieldDesc;

  /// No description provided for @privacyBadgeOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline Ready'**
  String get privacyBadgeOffline;

  /// No description provided for @privacyBadgeNoAccounts.
  ///
  /// In en, this message translates to:
  /// **'No Accounts'**
  String get privacyBadgeNoAccounts;

  /// No description provided for @privacyBadgeZeroAds.
  ///
  /// In en, this message translates to:
  /// **'Zero Ads'**
  String get privacyBadgeZeroAds;

  /// No description provided for @privacyOverviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get privacyOverviewTitle;

  /// No description provided for @privacyOverviewContent.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Pray in Time. Your privacy is of paramount importance to us. This Privacy Policy explains how our application handles your information. In short: Pray in Time is built on a privacy-first, on-device architecture. We do not operate external servers, and we never collect, sell, or share your personal data.'**
  String get privacyOverviewContent;

  /// No description provided for @privacyLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Location Data & City Detection'**
  String get privacyLocationTitle;

  /// No description provided for @privacyLocationContent.
  ///
  /// In en, this message translates to:
  /// **'To calculate accurate Islamic prayer times (Fajr, Sunrise, Dhuhr, Asr, Maghrib, and Isha) for your region, the application requests foreground access to your device\'s location.\n\n• On-Device Calculation: Your GPS coordinates are processed locally using astronomical algorithms and cached on your device for instant offline access.\n• City Name Display: Your device\'s built-in OS geocoder is used to display your city/region name in the app and save it locally.\n• No Background Location Tracking: Location is never tracked in the background or sent to our own servers.'**
  String get privacyLocationContent;

  /// No description provided for @privacyAlarmsTitle.
  ///
  /// In en, this message translates to:
  /// **'Alarms & Foreground Adhan Audio'**
  String get privacyAlarmsTitle;

  /// No description provided for @privacyAlarmsContent.
  ///
  /// In en, this message translates to:
  /// **'Pray in Time schedules prayer alarms up to 14 days ahead directly on your device so you never miss a prayer—even when the app is closed.\n\n• Native Exact Alarms: Scheduled locally through Android AlarmManager (AlarmClock) with automatic restoration after device restarts.\n• Foreground Audio Service: When prayer time enters, a temporary foreground media service runs solely to play the full Adhan audio and display a \"Stop Adhan\" notification control, then stops automatically.\n• Zero Push Servers: No cloud push services or external servers are used to trigger alerts.'**
  String get privacyAlarmsContent;

  /// No description provided for @privacyStorageTitle.
  ///
  /// In en, this message translates to:
  /// **'Preferences & Local Storage'**
  String get privacyStorageTitle;

  /// No description provided for @privacyStorageContent.
  ///
  /// In en, this message translates to:
  /// **'Data such as your onboarding status, app language, last detected coordinates, city name, scheduled local alarm times, calculation method, and juristic preferences are stored strictly on your device via SharedPreferences.\n\n• No user account or sign-up is required.\n• All locally stored data is permanently erased whenever you clear app data or uninstall the app.'**
  String get privacyStorageContent;

  /// No description provided for @privacyThirdPartyTitle.
  ///
  /// In en, this message translates to:
  /// **'Third-Party Services & Tracking'**
  String get privacyThirdPartyTitle;

  /// No description provided for @privacyThirdPartyContent.
  ///
  /// In en, this message translates to:
  /// **'Pray in Time does NOT include third-party analytics SDKs, advertising networks, or data brokers. We do not track your behavior, device identifiers, or usage habits.'**
  String get privacyThirdPartyContent;

  /// No description provided for @permissionsUsedHeader.
  ///
  /// In en, this message translates to:
  /// **'PERMISSIONS USED'**
  String get permissionsUsedHeader;

  /// No description provided for @permLocationTitle.
  ///
  /// In en, this message translates to:
  /// **'Location (Foreground GPS)'**
  String get permLocationTitle;

  /// No description provided for @permLocationDesc.
  ///
  /// In en, this message translates to:
  /// **'Used to calculate prayer schedules locally and detect your city name.'**
  String get permLocationDesc;

  /// No description provided for @permNotificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get permNotificationsTitle;

  /// No description provided for @permNotificationsDesc.
  ///
  /// In en, this message translates to:
  /// **'Alerts you when prayer time enters and provides the \"Stop Adhan\" button.'**
  String get permNotificationsDesc;

  /// No description provided for @permExactAlarmsTitle.
  ///
  /// In en, this message translates to:
  /// **'Exact Alarms'**
  String get permExactAlarmsTitle;

  /// No description provided for @permExactAlarmsDesc.
  ///
  /// In en, this message translates to:
  /// **'Triggers Adhan alarms accurately down to the second, even in Doze mode.'**
  String get permExactAlarmsDesc;

  /// No description provided for @permForegroundMediaTitle.
  ///
  /// In en, this message translates to:
  /// **'Foreground Media Playback & Wake Lock'**
  String get permForegroundMediaTitle;

  /// No description provided for @permForegroundMediaDesc.
  ///
  /// In en, this message translates to:
  /// **'Plays the full Adhan audio reliably when the screen is locked or the app is closed.'**
  String get permForegroundMediaDesc;

  /// No description provided for @permBootTitle.
  ///
  /// In en, this message translates to:
  /// **'Boot Completed'**
  String get permBootTitle;

  /// No description provided for @permBootDesc.
  ///
  /// In en, this message translates to:
  /// **'Automatically restores your scheduled local prayer alarms after a phone restart.'**
  String get permBootDesc;

  /// No description provided for @privacyQuestionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Have Questions About Privacy?'**
  String get privacyQuestionsTitle;

  /// No description provided for @privacyQuestionsDesc.
  ///
  /// In en, this message translates to:
  /// **'If you have any questions or suggestions regarding this privacy policy, we are glad to assist.'**
  String get privacyQuestionsDesc;

  /// No description provided for @privacyEmailButton.
  ///
  /// In en, this message translates to:
  /// **'Email: {email}'**
  String privacyEmailButton(String email);

  /// No description provided for @privacyFooterVersion.
  ///
  /// In en, this message translates to:
  /// **'Pray in Time • Version 1.0.0'**
  String get privacyFooterVersion;

  /// No description provided for @privacyLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last Updated: November 2026'**
  String get privacyLastUpdated;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
