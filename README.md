# 🕌 Pray in Time

A beautiful Flutter app that displays accurate Islamic prayer times based on your current location, featuring a live countdown timer to the next prayer, Hijri date display, and full daily prayer schedule.

## ✨ Features

- **📍 Location-Based Prayer Times** — Automatically detects your GPS location to calculate accurate prayer times using the [Adhan](https://pub.dev/packages/adhan) library with the **Egyptian** calculation method and **Shafi** madhab.
- **⏱️ Live Countdown Timer** — Real-time countdown to the next prayer that ticks every second.
- **🗓️ Hijri Date** — Displays the current Hijri (Islamic) calendar date.
- **📋 Daily Prayer Schedule** — Full list of all six prayer times (Fajr, Sunrise, Dhuhr, Asr, Maghrib, Isha) with icons and Arabic names.
- **🌙 Dark & Light Themes** — Custom-designed themes with an emerald & gold color palette using Material 3.
- **📱 Responsive UI** — Adaptive layout powered by `flutter_screenutil_plus`.
- **🏙️ Fallback Coordinates** — Falls back to Cairo coordinates (30.0444, 31.2357) if GPS is unavailable.

## 🛠️ Tech Stack

| Category | Technology |
|---|---|
| Framework | Flutter (Dart) |
| State Management | flutter_bloc (Cubit) |
| Prayer Calculations | [adhan](https://pub.dev/packages/adhan) |
| Location | [geolocator](https://pub.dev/packages/geolocator) |
| Hijri Calendar | [hijri_date](https://pub.dev/packages/hijri_date) |
| Responsive UI | [flutter_screenutil_plus](https://pub.dev/packages/flutter_screenutil_plus) |
| Typography | [google_fonts](https://pub.dev/packages/google_fonts) (Space Grotesk) |
| Loading Animations | [loading_animation_widget](https://pub.dev/packages/loading_animation_widget) |

## 📁 Project Structure

```
lib/
├── main.dart                          # App entry point
├── pray_in_time.dart                  # Root MaterialApp with BlocProvider
├── simble_bloc_ob.dart                # Bloc observer for debugging
│
├── core/
│   ├── logic/
│   │   ├── prayer_time_cubit.dart     # Cubit: fetches location & calculates prayer times
│   │   └── prayer_time_state.dart     # States: Initial, Loading, Loaded, Error
│   ├── theming/
│   │   ├── app_theme.dart             # Light & Dark ThemeData (Material 3)
│   │   └── app_color.dart             # Color palette constants
│   └── Route/                         # (Reserved for navigation)
│
└── feature/
    ├── ui/
    │   └── homescren/
    │       ├── home_screen.dart                        # Main screen scaffold
    │       ├── home_widget/
    │       │   ├── home_app_bar.dart                   # Custom AppBar with location & time
    │       │   ├── hijri_date.dart                     # Hijri date display
    │       │   ├── daily_prayer.dart                   # Daily prayer section
    │       │   ├── prayer_time_provider.dart           # BlocBuilder for prayer states
    │       │   ├── prayer_time_list_tile.dart           # Prayer list container
    │       │   ├── prayer_row.dart                     # Individual prayer row widget
    │       │   └── prayer_info.dart                    # PrayerInfo data model
    │       └── container_home_screen/
    │           ├── container_next_prayer_builder.dart  # BlocBuilder for next prayer section
    │           ├── conteiner_loaded_prayer.dart        # Next prayer container layout
    │           ├── next_prayer.dart                    # Next prayer name badge
    │           ├── timer_for_next_prayer.dart          # Live countdown timer widget
    │           └── prayer_at.dart                      # "Prayer at HH:MM" display
    └── widget/
        ├── prayer_time_loading_widget.dart             # Loading state widget
        └── prayer_time_error_widget.dart               # Error state widget
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `^3.12.2`
- Android Studio / VS Code with Flutter extension
- A physical device or emulator with location services enabled

### Installation

```bash
# Clone the repository
git clone https://github.com/your-username/Pray-in-time.git
cd Pray-in-time

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Permissions

The app requires **location permission** to calculate prayer times for your area. On first launch, it will request access to your device's GPS.

| Platform | Permission |
|---|---|
| Android | `ACCESS_FINE_LOCATION`, `ACCESS_COARSE_LOCATION` |
| iOS | `NSLocationWhenInUseUsageDescription` |

## 🎨 Design

The app uses a custom **Material 3** theme with:
- **Primary**: Emerald green
- **Secondary / Accent**: Gold
- **Dark mode** as default with a navy-toned surface palette
- **Typography**: Space Grotesk via Google Fonts

## 📄 License

This project is open source. Feel free to use and modify it.
