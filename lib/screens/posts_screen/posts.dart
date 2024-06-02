import 'package:flutter/material.dart';

import '../../components/app_bar_widget.dart';
import '../../components/modal_bottom_sheet.dart';
import '../../l10n/l10n.dart';
import '../../utils/assets.dart';
import '../../utils/extensions.dart';
import 'post_detail.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AppBarWidget(title: l10n.posts),
          InkWell(
            onTap: ()=> modalBottomSheet(
              context,
              const PostDetail(),
            ),
            child: AppIcons.fitness.pngPicture,
          ),
          const SizedBox(height: 10),
          Text(
            'Fitness vs Sport',
            style: textTheme.titleLarge?.copyWith(fontSize: 28),
          ),
          const SizedBox(height: 4),
          Text(
            'What is the difference between sports and fitness? You will learn more in this article.',
            style: textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
