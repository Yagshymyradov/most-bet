import 'package:flutter/material.dart';

import '../../../components/profile_image.dart';
import '../../../data/auth_model.dart';
import '../../../l10n/l10n.dart';
import '../../../utils/enums.dart';
import '../../../utils/extensions.dart';
import '../../../utils/theme/theme.dart';

class ChooseProfilePhoto extends StatefulWidget {
  final AuthModel authModel;
  final VoidCallback onNextButtonTap;

  const ChooseProfilePhoto({
    super.key,
    required this.onNextButtonTap,
    required this.authModel,
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

  void whenTapNextButton(){
    widget.authModel.photo = profileImage;

    if(widget.authModel.photo != null) {
      widget.onNextButtonTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final l10n = context.l10n;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 104),
          Text(
            l10n.letsCreteProfile,
            textAlign: TextAlign.center,
            style: textTheme.titleLarge,
          ),
          Text(
            l10n.chooseYourPhoto,
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
            onPressed: whenTapNextButton,
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
                profileImage != null //
                    ? null
                    : AppColors.primaryColor.withOpacity(0.5),
              ),
            ),
            child: Text(
              l10n.next,
              style: textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: 65),
        ],
      ),
    );
  }
}
