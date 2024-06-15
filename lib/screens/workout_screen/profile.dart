import 'dart:io';

import 'package:app_review/app_review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/opstions_card.dart';
import '../../components/profile_image.dart';
import '../../components/small_buttons.dart';
import '../../l10n/l10n.dart';
import '../../provider.dart';
import '../../utils/assets.dart';
import '../../utils/extensions.dart';
import '../../utils/theme/theme.dart';

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
      case ProfileOptions.resentProgress:
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 22),
              Text(
                l10n.profile,
                style: textTheme.headlineMedium?.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
              AppIcons.pen.svgPicture(),
            ],
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
          Text('${auth?.name}, ${auth?.age}', style: textTheme.titleLarge),
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
                onTap: option.onTap(onRateApp: onRateApp),
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
