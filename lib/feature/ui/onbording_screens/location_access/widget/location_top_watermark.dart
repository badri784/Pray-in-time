import 'package:flutter/material.dart';

class LocationTopWatermark extends StatelessWidget {
  const LocationTopWatermark({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: -10,
      child: Image.asset(
        'assets/image/SVG - Faint Islamic Geometric Star Watermark in background.png',
      ),
    );
  }
}

