import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../utils/assets.dart';
import '../utils/theme/theme.dart';
import 'statistic_sreen/statistic.dart';
import 'workout_screen/workout.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPage = 0;
  List<Widget> pages = [
    const Workout(),
    const Statistic(),
    const Center(child: Text('third screen')),
    const Center(child: Text('fourth screen')),
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          selectedPage = value;
          setState(() {
            //no-op
          });
        },
        currentIndex: selectedPage,
        items: [
          BottomNavigationBarItem(
            icon: AppIcons.workout.svgPicture(),
            label: l10n.workout,
            activeIcon: AppIcons.workout.svgPicture(color: AppColors.primaryColor),
          ),
          BottomNavigationBarItem(
            icon: AppIcons.statistic.svgPicture(),
            label: l10n.statistic,
            activeIcon: AppIcons.statistic.svgPicture(color: AppColors.primaryColor),
          ),
          BottomNavigationBarItem(
            icon: AppIcons.notes.svgPicture(),
            label: l10n.notes,
            activeIcon: AppIcons.notes.svgPicture(color: AppColors.primaryColor),
          ),
          BottomNavigationBarItem(
            icon: AppIcons.posts.svgPicture(),
            label: l10n.posts,
            activeIcon: AppIcons.posts.svgPicture(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
