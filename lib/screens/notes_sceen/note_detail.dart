import 'package:flutter/material.dart';

import '../../utils/assets.dart';
import '../../utils/extensions.dart';
import '../../utils/theme/theme.dart';

class NoteDetail extends StatelessWidget {
  const NoteDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: AppIcons.delete.svgPicture(),
            ),
            const Expanded(child: SizedBox()),
            IconButton(
              onPressed: () {},
              icon: AppIcons.favorite.svgPicture(),
            ),
            IconButton(
              onPressed: () {},
              icon: AppIcons.pen.svgPicture(),
            ),
          ],
        ),
        const SizedBox(height: 3),
        Text('Help for yoga', style: textTheme.titleLarge),
        const SizedBox(height: 10),
        Text('22.01.2024', style: textTheme.bodyLarge),
        const SizedBox(height: 16),
        Text(
          'Lorem ipsum dolor sit amet consectetur. In neque leo varius phasellus tincidunt cras eget nunc. Posuere viverra commodo integer odio lectus. Erat urna et amet nibh et. Eu ut mattis dignissim augue. Lorem ipsum dolor sit amet consectetur. In neque leo varius phasellus tincidunt cras eget nunc. Posuere viverra commodo integer odio lectus. Erat urna et amet nibh et. Eu ut mattis dignissim augue. Lorem ipsum dolor sit amet consectetur. In neque leo varius phasellus tincidunt cras eget nunc. Posuere viverra commodo integer odio lectus. Erat urna et amet nibh et. Eu ut mattis dignissim augue.Lorem ipsum dolor sit amet consectetur. In neque leo varius phasellus tincidunt cras eget nunc. Posuere viverra commodo integer odio lectus. Erat urna et amet nibh et. Eu ut mattis dignissim augue.',
          style: textTheme.bodyLarge?.copyWith(color: AppColors.blackColor),
        ),
      ],
    );
  }
}
