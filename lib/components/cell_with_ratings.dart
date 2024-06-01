import 'package:flutter/cupertino.dart';

import '../l10n/l10n.dart';
import '../utils/extensions.dart';
import '../utils/theme/theme.dart';

class CellWithRatings extends StatelessWidget {
  final String title;
  final int evaluate;

  const CellWithRatings({
    super.key,
    required this.title,
    required this.evaluate,
  });

  Color cellColor(int cell) {
    switch (cell) {
      case 1:
        return AppColors.lightGreenColor;
      case 2:
        return AppColors.greenColor;
      case 3:
        return AppColors.easyYellowColor;
      case 4:
        return AppColors.lightYellowColor;
      case 5:
        return AppColors.yellowColor;
      case 6:
        return AppColors.yellowColor;
      case 7:
        return AppColors.darkYellowColor;
      case 8:
        return AppColors.easyRedColor;
      case 9:
        return AppColors.lightRedColor;
      case 10:
        return AppColors.darkRedColor;
    }
    return AppColors.textSecondaryColor;
  }

  BorderRadius? borderRadius(int index) {
    if (index == 0) {
      return const BorderRadius.only(
        topLeft: Radius.circular(5),
        bottomLeft: Radius.circular(5),
      );
    } else if (index == 9) {
      return const BorderRadius.only(
        topRight: Radius.circular(5),
        bottomRight: Radius.circular(5),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.bodyLarge?.copyWith(
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: List.generate(
            10,
            (index) {
              return Expanded(
                child: SizedBox(
                  height: 4,
                  child: Padding(
                    padding: EdgeInsets.only(left: index == 0 ? 0 : 4),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: index + 1 <= evaluate
                            ? cellColor(evaluate)
                            : AppColors.textSecondaryColor,
                        borderRadius: borderRadius(index),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              evaluate.toString(),
              style: textTheme.displaySmall,
            ),
            Text(
              context.l10n.ten,
              style: textTheme.displaySmall,
            ),
          ],
        ),
      ],
    );
  }
}
