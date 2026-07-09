import 'package:flutter/material.dart';
import 'package:pray_in_time/feature/ui/homescren/home_screen.dart';

class PrayerInTimeApp extends StatelessWidget {
  const PrayerInTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.deepPurple,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
