import 'package:flutter/material.dart';

import '../../../components/profile_image.dart';
import '../../../utils/enums.dart';
import '../../../utils/extensions.dart';
import '../../../utils/theme/theme.dart';

class ChooseProfilePhoto extends StatefulWidget {
  final VoidCallback onNextButtonTap;

  const ChooseProfilePhoto({
    super.key,
    required this.onNextButtonTap,
  });

  @override
  State<ChooseProfilePhoto> createState() => _ChooseProfilePhotoState();
}

class _ChooseProfilePhotoState extends State<ChooseProfilePhoto> {
  ProfilePhoto? profileImage;

  void onProfileImageTap(ProfilePhoto photo) {
    profileImage = photo;
    setState(() {
      //no-op
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 104),
          Text(
            'Let’s create your profile!',
            textAlign: TextAlign.center,
            style: textTheme.titleLarge,
          ),
          Text(
            'Choose your character photo',
            textAlign: TextAlign.center,
            style: textTheme.headlineMedium,
          ),
          const SizedBox(height: 36),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: ProfilePhoto.values
                .map(
                  (e) => InkWell(
                    borderRadius: BorderRadius.circular(100),
                    onTap: () => onProfileImageTap(e),
                    child: ProfileImage(
                      image: e.asImage,
                      backgroundColor: e.backgroundColor(profileImage == e),
                    ),
                  ),
                )
                .toList(growable: false),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: profileImage == null ? null : widget.onNextButtonTap,
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                profileImage != null //
                    ? null
                    : AppColors.primaryColor.withOpacity(0.5),
              ),
            ),
            child: Text(
              'Next',
              style: textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: 65),
        ],
      ),
    );
  }
}
