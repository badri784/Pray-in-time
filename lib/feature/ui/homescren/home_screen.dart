import 'dart:math';

import 'package:animated_icon/animated_icon.dart';
import 'package:flutter/material.dart';
import 'package:pray_in_time/feature/ui/homescren/home_widget/home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   Container(
        //     padding: EdgeInsets.all(8.sp),
        //     decoration: BoxDecoration(
        //       color: Theme.of(context).colorScheme.surface,
        //       borderRadius: BorderRadius.circular(12.r),
        //     ),
        //     child: AnimateIcon(
        //       key: UniqueKey(),
        //       onTap: () {},
        //       color: Colors.white,
        //       iconType: IconType.onlyIcon,
        //       animateIcon: AnimateIcons.settings,
        //     ),
        //   ),
        // ],
        title: const HomeAppBar(),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          AnimateIcon(
            key: UniqueKey(),
            onTap: () {},
            iconType: IconType.continueAnimation,
            height: 700,
            width: 700,
            color: Color.fromRGBO(
              Random.secure().nextInt(255),
              Random.secure().nextInt(255),
              Random.secure().nextInt(255),
              1,
            ),
            animateIcon: AnimateIcons.bell,
          ),
        ],
      ),
    );
  }
}
