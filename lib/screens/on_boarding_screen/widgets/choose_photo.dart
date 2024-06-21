import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../components/profile_image.dart';
import '../../../data/auth_model.dart';
import '../../../l10n/l10n.dart';
import '../../../provider.dart';
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

  @override
  void initState() {
    initialValue();
    super.initState();
  }

  void initialValue() {
    final scope = ProviderScope.containerOf(context, listen: false);
    final auth = scope.read(authControllerProvider);
    if (auth?.photo != null) {
      profileImage = auth!.photo;
    }
  }

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

    return Stack(
      children: [
        ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
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
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
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
            ),
          ),
        ),
      ],
    );
  }
}
