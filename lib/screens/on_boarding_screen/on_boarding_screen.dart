import 'package:flutter/material.dart';

import '../../data/auth_model.dart';
import '../../utils/navigation.dart';
import '../../utils/theme/theme.dart';
import '../main_screen.dart';
import 'widgets/choose_photo.dart';
import 'widgets/choose_workout_type.dart';
import 'widgets/name_age_field.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final authModel = AuthModel();
  final controller = PageController();
  int selectedPage = 0;

  void onNextButtonTap() {
    selectedPage == 2
        ? replaceRootScreen<void>(context, const MainScreen())
        : controller.nextPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            const SizedBox(height: 54),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: SizedBox(
                    width: 40,
                    height: 4,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: selectedPage >= index
                            ? AppColors.primaryColor
                            : AppColors.textSecondaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                onPageChanged: (page) {
                  selectedPage = page;
                  setState(() {
                    //no-op
                  });
                },
                children: [
                  NameAgeField(
                    onNextButtonTap: onNextButtonTap,
                    authModel: authModel,
                  ),
                  ChooseProfilePhoto(
                    onNextButtonTap: onNextButtonTap,
                    authModel: authModel,
                  ),
                  ChooseWorkoutType(
                    onNextButtonTap: onNextButtonTap,
                    authModel: authModel,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
