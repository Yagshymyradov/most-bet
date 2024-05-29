import 'dart:async';

import 'package:flutter/material.dart';

import '../components/linear_percent_indicator.dart';
import '../utils/assets.dart';
import '../utils/navigation.dart';
import '../utils/theme/theme.dart';
import 'on_boarding_screen/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late final animController = AnimationController(vsync: this);
  Timer? timer;
  double percent = 0;

  void replaceWithRootScreen() {
    replaceRootScreen(context, const OnBoardingScreen());
  }

  @override
  void initState() {
    super.initState();

    animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        replaceWithRootScreen();
      }
    });

    durationSecond();

    animController
      ..duration = const Duration(seconds: 2)
      ..forward();
  }

  void durationSecond() {
    timer = Timer.periodic(
      const Duration(milliseconds: 900),
          (timer) {
        percent += 0.5;
        setState(() {
          //no-op
        });
      },
    );
  }

  @override
  void dispose() {
    animController.dispose();
    timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(),
          AppIcons.logoReviewers.svgPicture(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: LinearPercentIndicator(
              lineHeight: 6,
              percent: percent,
              animation: true,
              animateFromLastPercent: true,
              barRadius: const Radius.circular(10),
              backgroundColor: AppColors.textSecondaryColor,
              progressColor: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
