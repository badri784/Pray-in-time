// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'صلاتي في وقتها';

  @override
  String get routeNotFound => 'الصفحة غير موجودة، يرجى المحاولة مرة أخرى.';

  @override
  String get loading => 'جاري التحميل...';

  @override
  String get okButton => 'حسناً';

  @override
  String get comingSoon => 'قريباً...';

  @override
  String get retryAgain => 'إعادة المحاولة';

  @override
  String get onboardingNotificationTitle => 'لا تفوّت صلاتك أبداً';

  @override
  String get onboardingNotificationSubtitle =>
      'اسمح بالإشعارات لإيقاظ شاشتك وسماع\nصوت الأذان العذب في أوقات الصلاة';

  @override
  String get allowNotificationsButton => 'تفعيل الإشعارات';

  @override
  String notificationPermissionError(String error) {
    return 'خطأ في صلاحية الإشعارات: $error';
  }

  @override
  String get onboardingLocationTitle => 'مواقيت صلاة دقيقة';

  @override
  String get onboardingLocationSubtitle =>
      'يرجى السماح بالوصول إلى الموقع لحساب\nمواقيت الصلاة بدقة لمدينتك';

  @override
  String get enableLocationButton => 'تفعيل الموقع الجغرافي';

  @override
  String get detectedLocation => 'الموقع محدد';

  @override
  String get loadingPrayer => 'جاري تحميل الصلاة...';

  @override
  String get loadingPrayerTimes => 'جاري تحميل مواقيت الصلاة...';

  @override
  String get noPrayerTimesFound => 'لم يتم العثور على مواقيت الصلاة';

  @override
  String nextPrayerLabel(String prayer) {
    return 'الصلاة القادمة: $prayer';
  }

  @override
  String get prayerAt => 'موعد الصلاة ';

  @override
  String get mandatoryAlarmActive => 'منبه الأذان مفعّل';

  @override
  String get dailyPrayerSchedule => 'جدول الصلوات اليومي';

  @override
  String get comingUpNext => 'الصلاة القادمة';

  @override
  String get alarmsArmed => '.. المنبهات مفعّلة';

  @override
  String get prayerFajr => 'الفجر';

  @override
  String get prayerSunrise => 'الشروق';

  @override
  String get prayerDhuhr => 'الظهر';

  @override
  String get prayerAsr => 'العصر';

  @override
  String get prayerMaghrib => 'المغرب';

  @override
  String get prayerIsha => 'العشاء';

  @override
  String get prayerGeneral => 'الصلاة';

  @override
  String get adhanChannelName => 'إشعارات الأذان';

  @override
  String get adhanChannelDesc => 'قناة الأذان والتنبيهات لأوقات الصلاة';

  @override
  String adhanNotificationTitle(String prayer) {
    return 'حان وقت صلاة $prayer';
  }

  @override
  String get adhanNotificationBody => 'حيّ على الصلاة 🕌';

  @override
  String get errorLocationDisabled =>
      'خدمات الموقع متوقفة، يرجى تفعيل الـ GPS.';

  @override
  String get errorLocationDenied =>
      'تم رفض صلاحية الموقع، يرجى السماح بالوصول للموقع.';

  @override
  String get errorLocationPermanentlyDenied =>
      'صلاحية الموقع مرفوضة نهائياً، يرجى تفعيلها من إعدادات الهاتف.';

  @override
  String get errorLoadCityName => 'تعذّر تحديد اسم المدينة.';

  @override
  String get errorLoadPrayerTimes =>
      'تعذّر تحميل مواقيت الصلاة، يرجى المحاولة مرة أخرى.';

  @override
  String get unknownLocation => 'موقع غير معروف';

  @override
  String get settingsTitle => 'الإعدادات';

  @override
  String get alarmAndNotificationSection => 'التنبيهات والإشعارات';

  @override
  String get adhanSounds => 'أصوات الأذان';

  @override
  String get defaultOption => 'الافتراضي';

  @override
  String get locationSection => 'الموقع الجغرافي';

  @override
  String get currentLocation => 'الموقع الحالي';

  @override
  String get cityNotFound => 'لم يتم تحديد المدينة';

  @override
  String autoDetectSubtitle(String city) {
    return '$city،\nتحديد تلقائي';
  }

  @override
  String get languageSection => 'اللغة';

  @override
  String get languageTileTitle => 'لغة التطبيق (العربية)';

  @override
  String get languageTileSubtitle => 'بدّل الزر لتغيير اللغة إلى الإنجليزية';

  @override
  String get supportAndInfoSection => 'الدعم والمعلومات';

  @override
  String get contactUs => 'تواصل معنا';

  @override
  String get privacyPolicy => 'سياسة الخصوصية';

  @override
  String get aboutAndRateUs => 'عن التطبيق وتقييمنا';

  @override
  String get versionNumber => 'الإصدار 1.0.0';

  @override
  String get developerName => 'أحمد صلاح';

  @override
  String get developerRole => 'مهندس برمجيات • صلاتي في وقتها';

  @override
  String get developerBio =>
      'هل لديك استفسار أو اقتراح أو تحتاج إلى مساعدة؟ يسعدني تواصلك في أي وقت.';

  @override
  String get getInTouchSection => 'وسائل التواصل';

  @override
  String get callDirectly => 'اتصال مباشر';

  @override
  String get copyPhoneTooltip => 'نسخ الرقم';

  @override
  String get callTooltip => 'اتصال';

  @override
  String get whatsappTitle => 'واتساب';

  @override
  String whatsappSubtitle(String phone) {
    return 'محادثة عبر $phone';
  }

  @override
  String get chatAction => 'محادثة';

  @override
  String get sendEmailTitle => 'إرسال بريد إلكتروني';

  @override
  String get copyEmailTooltip => 'نسخ البريد';

  @override
  String get composeTooltip => 'مراسلة';

  @override
  String get linkedinTitle => 'حساب لينكدإن';

  @override
  String get connectAction => 'تواصل';

  @override
  String get sendQuickMessageSection => 'أرسل رسالة سريعة';

  @override
  String get subjectHint => 'الموضوع (مثال: اقتراح، مشكلة، رأي)';

  @override
  String get messageHint => 'اكتب رسالتك هنا...';

  @override
  String sendToEmail(String email) {
    return 'إرسال إلى $email';
  }

  @override
  String get contactReplyTime => 'نرد عادةً خلال 24 ساعة';

  @override
  String get couldNotLaunchAction =>
      'تعذّر فتح الرابط، يرجى المحاولة مرة أخرى.';

  @override
  String get whatsappDefaultMessage =>
      'السلام عليكم يا أحمد،\nأتواصل معك بخصوص تطبيق صلاتي في وقتها (Pray in Time).';

  @override
  String get emailDefaultSubject => 'دعم وملاحظات تطبيق صلاتي في وقتها';

  @override
  String get emailFeedbackSubject => 'ملاحظات حول تطبيق صلاتي في وقتها';

  @override
  String get phoneNumberLabel => 'رقم الهاتف';

  @override
  String get emailAddressLabel => 'البريد الإلكتروني';

  @override
  String copiedToClipboard(String label) {
    return 'تم نسخ $label إلى الحافظة';
  }

  @override
  String get privacyEmailSubject => 'صلاتي في وقتها - استفسار حول الخصوصية';

  @override
  String get privacyShieldTitle => 'خصوصيتك أمانة';

  @override
  String get privacyShieldDesc =>
      'يعمل التطبيق بالكامل على جهازك دون أي تتبع أو إعلانات أو جمع بيانات خارجي.';

  @override
  String get privacyBadgeOffline => 'يعمل بدون إنترنت';

  @override
  String get privacyBadgeNoAccounts => 'بدون حسابات';

  @override
  String get privacyBadgeZeroAds => 'بدون إعلانات';

  @override
  String get privacyOverviewTitle => 'نظرة عامة';

  @override
  String get privacyOverviewContent =>
      'مرحباً بك في تطبيق صلاتي في وقتها. خصوصيتك تمثل أولوية قصوى بالنسبة لنا. توضح سياسة الخصوصية هذه كيفية تعامل التطبيق مع بياناتك. باختصار: صُمم التطبيق بمعمارية تعمل بالكامل على جهازك أولاً، فنحن لا ندير أي خوادم خارجية ولا نجمع أو نبيع أو نشارك بياناتك الشخصية أبداً.';

  @override
  String get privacyLocationTitle => 'بيانات الموقع وتحديد المدينة';

  @override
  String get privacyLocationContent =>
      'لحساب مواقيت الصلاة الإسلامية بدقة (الفجر، الشروق، الظهر، العصر، المغرب، والعشاء) لمنطقتك، يطلب التطبيق صلاحية الوصول إلى موقع جهازك أثناء الاستخدام.\n\n• الحساب على الجهاز: تُعالج إحداثيات الـ GPS محلياً عبر معادلات فلكية دقيقة وتُحفظ على جهازك للعمل فوراً بدون إنترنت.\n• عرض اسم المدينة: يُستخدم محرك العناوين المدمج في نظام الهاتف لعرض اسم مدينتك/منطقتك داخل التطبيق وحفظه محلياً.\n• لا تتبع في الخلفية: لا يتم تتبع موقعك في الخلفية أو إرساله إلى أي خوادم خاصة بنا.';

  @override
  String get privacyAlarmsTitle => 'المنبهات وتشغيل صوت الأذان';

  @override
  String get privacyAlarmsContent =>
      'يقوم التطبيق بجدولة منبهات الصلاة لمدة تصل إلى 14 يوماً مقدماً مباشرةً على جهازك حتى لا تفوتك أي صلاة حتى لو كان التطبيق مغلقاً تماماً.\n\n• منبهات النظام الدقيقة: تُجدول محلياً عبر مدير المنبهات في أندرويد (AlarmClock) مع استعادة تلقائية بعد إعادة تشغيل الهاتف.\n• خدمة الصوت الأمامية: عند دخول وقت الصلاة، تعمل خدمة وسائط مؤقتة فقط لتشغيل صوت الأذان كاملاً وإظهار زر \"إيقاف الأذان\" في الإشعار، ثم تتوقف تلقائياً.\n• بدون خوادم إشعارات: لا نستخدم أي خدمات سحابية خارجية لإرسال التنبيهات.';

  @override
  String get privacyStorageTitle => 'الإعدادات والتخزين المحلي';

  @override
  String get privacyStorageContent =>
      'تُخزن البيانات مثل حالة البدء، لغة التطبيق، آخر إحداثيات محددة، اسم المدينة، جدول المنبهات المحلي، وطريقة الحساب حصرياً على جهازك عبر SharedPreferences.\n\n• لا يتطلب التطبيق إنشاء حساب أو تسجيل دخول.\n• تُحذف جميع البيانات المخزنة محلياً نهائياً بمجرد مسح بيانات التطبيق أو إلغاء تثبيته.';

  @override
  String get privacyThirdPartyTitle => 'خدمات الطرف الثالث والتتبع';

  @override
  String get privacyThirdPartyContent =>
      'لا يحتوي التطبيق على أي حزم تحليلات خارجية (Analytics) أو شبكات إعلانية أو وسطاء بيانات. نحن لا نتتبع سلوكك أو معرّفات جهازك أو عادات استخدامك.';

  @override
  String get permissionsUsedHeader => 'الصلاحيات المستخدمة';

  @override
  String get permLocationTitle => 'الموقع الجغرافي (أثناء الاستخدام)';

  @override
  String get permLocationDesc =>
      'يُستخدم لحساب مواقيت الصلاة محلياً وتحديد اسم مدينتك.';

  @override
  String get permNotificationsTitle => 'الإشعارات';

  @override
  String get permNotificationsDesc =>
      'لتنبيهك عند دخول وقت الصلاة وإظهار زر \"إيقاف الأذان\".';

  @override
  String get permExactAlarmsTitle => 'المنبهات الدقيقة';

  @override
  String get permExactAlarmsDesc =>
      'لإطلاق منبه الأذان في الثانية المحددة بدقة حتى في وضع سكون الهاتف.';

  @override
  String get permForegroundMediaTitle =>
      'تشغيل الوسائط في الخلفية وإيقاظ الجهاز';

  @override
  String get permForegroundMediaDesc =>
      'لتشغيل صوت الأذان كاملاً بوضوح حتى والشاشة مغلقة أو التطبيق مقفول.';

  @override
  String get permBootTitle => 'التشغيل بعد إعادة فتح الهاتف';

  @override
  String get permBootDesc =>
      'لاستعادة جدول منبهات الصلاة تلقائياً بعد إعادة تشغيل الهاتف.';

  @override
  String get privacyQuestionsTitle => 'هل لديك استفسار حول الخصوصية؟';

  @override
  String get privacyQuestionsDesc =>
      'إذا كان لديك أي سؤال أو اقتراح بخصوص سياسة الخصوصية، يسعدنا تواصلك معنا.';

  @override
  String privacyEmailButton(String email) {
    return 'البريد: $email';
  }

  @override
  String get privacyFooterVersion => 'صلاتي في وقتها • الإصدار 1.0.0';

  @override
  String get privacyLastUpdated => 'آخر تحديث: نوفمبر 2026';
}
