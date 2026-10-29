import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../feature/ui/homescren/home_screen.dart';
import '../../feature/ui/onbording_screens/location_access/loaction_access.dart';
import '../../feature/ui/onbording_screens/notification_access/notification_access.dart';
import '../logic/prayer_time_cubit.dart';
import 'route.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.locationAccess:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => PrayerTimeCubit()..getLoactionPermisons(),
            child: const LoactionAccess(),
          ),
        );
      case Routes.notificationAccess:
        return MaterialPageRoute(
          builder: (context) => const NotificationAccess(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => PrayerTimeCubit()..getPrayerTimes(),
            child: const HomeScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('there is no route here please try agine'),
            ),
          ),
        );
    }
  }
}
