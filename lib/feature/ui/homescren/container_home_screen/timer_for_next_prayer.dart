import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/utils/responsive_helper.dart';

class TimerForNextPrayer extends StatefulWidget {
  const TimerForNextPrayer({super.key, required this.nextPrayerTime});

  final DateTime? nextPrayerTime;

  @override
  State<TimerForNextPrayer> createState() => _TimerForNextPrayerState();
}

class _TimerForNextPrayerState extends State<TimerForNextPrayer> {
  late Duration _remaining;
  Timer? _timer;
  bool isDayEnd = false;
  bool salahIsNow = false;

  String dayEndAndNextPrayer(DateTime date) {
    DateTime now = DateTime.now();
    if (date.isAfter(now)) {
      return _formatDuration(_remaining);
    } else {
      return dayEndAndNextPrayer(date.add(const Duration(days: 1)));
    }
  }

  @override
  void initState() {
    super.initState();
    _updateRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      _updateRemaining();
    });
  }

  @override
  void didUpdateWidget(TimerForNextPrayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.nextPrayerTime != widget.nextPrayerTime) {
      setState(() {
        _updateRemaining();
      });
    }
  }

  void _updateRemaining() {
    final now = DateTime.now();
    final target = widget.nextPrayerTime;
    if (target == null || target.isBefore(now)) {
      setState(() {
        //if now is after the next prayer time , then it is the next prayer time
        _remaining = Duration.zero;
        isDayEnd = true;
      });
    } else {
      setState(() {
        _remaining = target.difference(now);
        isDayEnd = false;
      });
    }
  }

  String _formatDuration(Duration d) {
    final hours = d.inHours;
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatDuration(_remaining),
      style: TextStyle(fontSize: 48.clampSp(), fontWeight: FontWeight.bold),
    );
  }
}
