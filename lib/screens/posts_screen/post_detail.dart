import 'package:flutter/material.dart';

import '../../utils/extensions.dart';

class PostDetail extends StatelessWidget {
  final String title;
  final Widget image;
  final String description;

  const PostDetail({
    super.key,
    required this.title,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const SizedBox(height: 44),
        Text(
          title,
          style: textTheme.titleLarge,
        ),
        const SizedBox(height: 10),
        image,
        const SizedBox(height: 10),
        Text(
          description,
          style: textTheme.titleMedium,
        )
      ],
    );
  }
}
