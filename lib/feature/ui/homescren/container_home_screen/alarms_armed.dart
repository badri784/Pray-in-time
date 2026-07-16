import 'package:flutter/material.dart';

class AlarmsArmed extends StatelessWidget {
  const AlarmsArmed({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Pray in Time ',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            ),
            const TextSpan(text: '.. Alarms Armed'),
          ],
        ),
      ),
    );
  }
}
