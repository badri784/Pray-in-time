import 'package:flutter/material.dart';

class NotificationAccessBackground extends StatelessWidget {
  const NotificationAccessBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (bounds) => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.black, Colors.transparent],
      ).createShader(bounds),
      child: Image.asset(
        'assets/image/loaction_access_background.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
      ),
    );
  }
}

