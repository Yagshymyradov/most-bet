import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/app_bar_widget.dart';
import '../../components/modal_bottom_sheet.dart';
import '../../components/opstions_card.dart';
import '../../components/small_buttons.dart';
import '../../data/statistic_controller.dart';
import '../../l10n/l10n.dart';
import '../../utils/enums.dart';
import '../../utils/extensions.dart';
import '../../utils/theme/theme.dart';
import 'add_statistic.dart';

class Statistic extends ConsumerStatefulWidget {
  const Statistic({super.key});

  @override
  ConsumerState<Statistic> createState() => _StatisticState();
}

class _StatisticState extends ConsumerState<Statistic> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    final statistic = ref.watch(statisticProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: AppBarWidget(title: l10n.statistic)),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 36,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: Month.values
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: SmallButton(
                                title: e.asValue(context),
                                backgroundColor: e != Month.january
                                    ? AppColors.primaryColor.withOpacity(0.5)
                                    : AppColors.primaryColor,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 20),
                ),
                SliverGrid(
                  delegate: SliverChildListDelegate.fixed(
                    [
                      OptionsCard(
                        title: 'Yoga',
                        icons: Text(
                          l10n.ten,
                          style: textTheme.titleLarge?.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                      OptionsCard(
                        title: 'Yoga',
                        icons: Text(
                          l10n.ten,
                          style: textTheme.titleLarge?.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        backgroundColor: AppColors.primaryColor,
                      ),
                      OptionsCard(
                        title: 'Yoga',
                        icons: Text(
                          l10n.ten,
                          style: textTheme.titleLarge?.copyWith(
                            color: AppColors.whiteColor,
                          ),
                        ),
                        backgroundColor: AppColors.primaryColor,
                      ),
                      OptionsCard(
                        title: 'Yoga',
                        icons: Text(
                          l10n.ten,
                          style: textTheme.titleLarge?.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 18,
              right: 22,
              child: SmallButton(
                onTap: () => modalBottomSheet(
                  context,
                  const AddStatistic(),
                ).whenComplete(() => setState(() {})),
                title: l10n.addStatistics,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
