import 'package:flutter/material.dart';

class LocationAccessBackground extends StatelessWidget {
  const LocationAccessBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShaderMask(
        blendMode: BlendMode.dstIn,
        shaderCallback: (bounds) => const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black, Colors.transparent],
        ).createShader(bounds),
        child: Image.asset(
          'assets/image/location_access_image.png',
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

