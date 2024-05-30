import 'package:flutter/material.dart';

import '../utils/theme/theme.dart';

class ProfileImage extends StatelessWidget {
  final double width;
  final double height;
  final Widget image;
  final Color? backgroundColor;

  const ProfileImage({
    super.key,
    required this.image,
    this.width = 174,
    this.height = 174,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: backgroundColor ?? AppColors.primaryColor.withOpacity(0.5),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: image,
        ),
      ),
    );
  }
}
