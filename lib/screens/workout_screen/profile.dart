import 'dart:io';

import 'package:app_review/app_review.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/opstions_card.dart';
import '../../components/profile_image.dart';
import '../../components/small_buttons.dart';
import '../../data/notes_model.dart';
import '../../data/statistic_model.dart';
import '../../data/workout_history_model.dart';
import '../../l10n/l10n.dart';
import '../../provider.dart';
import '../../utils/assets.dart';
import '../../utils/extensions.dart';
import '../../utils/navigation.dart';
import '../../utils/theme/theme.dart';
import '../splash_screen.dart';

enum ProfileOptions {
  shareApp,
  rateApp,
  usageProfile,
  resentProgress;

  String asValue(BuildContext context) {
    final l10n = context.l10n;

    switch (this) {
      case ProfileOptions.shareApp:
        return l10n.shareApp;
      case ProfileOptions.rateApp:
        return l10n.rateApp;
      case ProfileOptions.usageProfile:
        return l10n.usageProfile;
      case ProfileOptions.resentProgress:
        return l10n.resentProgress;
    }
  }

  Widget get asIcons {
    switch (this) {
      case ProfileOptions.shareApp:
        return AppIcons.share.svgPicture();
      case ProfileOptions.rateApp:
        return AppIcons.star.svgPicture();
      case ProfileOptions.usageProfile:
        return AppIcons.file.svgPicture();
      case ProfileOptions.resentProgress:
        return AppIcons.recent.svgPicture();
    }
  }

  VoidCallback? onTap({
    VoidCallback? onShareApp,
    VoidCallback? onRateApp,
    VoidCallback? onUsageProfile,
    VoidCallback? onResentProgress,
  }) {
    switch (this) {
      case ProfileOptions.shareApp:
        return onShareApp;
      case ProfileOptions.rateApp:
        return onRateApp;
      case ProfileOptions.usageProfile:
        return onUsageProfile;
      case ProfileOptions.resentProgress:
        return onResentProgress;
    }
    return null;
  }
}

class Profile extends ConsumerWidget {
  const Profile({super.key});

  void onRateApp() {
    if (Platform.isIOS) {
      AppReview.requestReview;
    }
  }

  Future<void> onDeleteResentButtonTap(BuildContext context, WidgetRef ref, {bool? delete}) async {
    final auth = ref.read(authControllerProvider.notifier);

    try {
      await Hive.box<WorkoutHistoryModel>('workout_history').clear();
      await Hive.box<StatisticModel>('statistic').clear();
      await Hive.box<NotesModel>('notes').clear();
      await Hive.box<NotesModel>('favorite_notes').clear();

      if (delete != null && delete) {
        await auth.logout();
      }
      if (context.mounted) {
        Navigator.pop(context);
        await replaceRootScreen(context, const SplashScreen());
      }
    } catch (e) {
      //ignore
    }
  }

  Future<void> onShareButtonTap() async {
    await Share.share(
      'https://apps.apple.com/app/universal-key/id6504188651',
    );
  }

  Future<void> launchInBrowser() async {
    final url = Uri.parse('https://www.termsfeed.com/live/e080369e-ab7f-4406-9c31-d348d0545400');
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authControllerProvider);
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: OverflowBox(
              maxWidth: MediaQuery.sizeOf(context).width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => onDeleteResentButtonTap(context, ref, delete: true),
                    icon: AppIcons.delete.svgPicture(),
                  ),
                  Text(
                    l10n.profile,
                    style: textTheme.headlineMedium?.copyWith(
                      color: AppColors.blackColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: AppIcons.pen.svgPicture(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 21),
          Align(
            child: ProfileImage(
              width: 80,
              height: 80,
              image: auth?.photo?.asImage ?? const SizedBox(),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            auth?.name == '' ? 'Unnamed' : '${auth?.name} ${auth?.age}',
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: auth?.workoutTypes
                    ?.map(
                      (e) => SmallButton(
                        title: e.asValue(context),
                      ),
                    )
                    .toList(growable: false) ??
                [],
          ),
          const Spacer(),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ProfileOptions.values.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final option = ProfileOptions.values[index];
              return OptionsCard(
                onTap: option.onTap(
                    onShareApp: onShareButtonTap,
                    onRateApp: onRateApp,
                    onUsageProfile: launchInBrowser,
                    onResentProgress: () => onDeleteResentButtonTap(context, ref)),
                icons: option.asIcons,
                title: option.asValue(context),
              );
            },
          ),
        ],
      ),
    );
  }
}
