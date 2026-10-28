import 'package:flutter/material.dart';

import '../../feature/ui/onbording_screens/location_access/loaction_access.dart';
import '../../feature/ui/onbording_screens/notification_access/notification_access.dart';
import 'route.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.locationAccess:
        return MaterialPageRoute(builder: (context) => const LoactionAccess());
      case AppRoutes.notificationAccess:
        return MaterialPageRoute(
          builder: (context) => const NotificationAccess(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Erorr'))),
        );
    }
  }
}
