import 'package:flutter/material.dart';

class LocationBottomWatermark extends StatelessWidget {
  const LocationBottomWatermark({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: -12,
      child: Image.asset('assets/image/SVG (1).png'),
    );
  }
}

