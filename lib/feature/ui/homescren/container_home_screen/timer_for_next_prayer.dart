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
      _updateRemaining();
    }
  }

  void _updateRemaining() {
    final now = DateTime.now();
    final target = widget.nextPrayerTime;
    if (target == null || target.isBefore(now)) {
      setState(() => _remaining = Duration.zero);
    } else {
      setState(() => _remaining = target.difference(now));
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
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
  Widget build(BuildContext context) {
    return Text(
      _formatDuration(_remaining),
      style: TextStyle(fontSize: 48.clampSp(), fontWeight: FontWeight.bold),
    );
  }
}
