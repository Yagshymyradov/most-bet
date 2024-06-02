import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider.dart';
import '../screens/workout_screen/profile.dart';
import '../utils/extensions.dart';
import 'modal_bottom_sheet.dart';
import 'profile_image.dart';

class AppBarWidget extends ConsumerWidget {
  final String title;

  const AppBarWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () => modalBottomSheet(context, const Profile()),
            child: ProfileImage(
              width: 44,
              height: 44,
              image: authState?.photo?.asImage ?? const SizedBox(),
            ),
          ),
        ),
        Text(title, style: textTheme.titleLarge),
      ],
    );
  }
}
