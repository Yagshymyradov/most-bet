import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../components/app_bar_widget.dart';
import '../../components/indicators.dart';
import '../../components/modal_bottom_sheet.dart';
import '../../components/opstions_card.dart';
import '../../components/small_buttons.dart';
import '../../data/statistic_controller.dart';
import '../../data/statistic_model.dart';
import '../../l10n/l10n.dart';
import '../../utils/extensions.dart';
import '../../utils/theme/theme.dart';
import 'add_statistic.dart';

class Statistic extends ConsumerStatefulWidget {
  const Statistic({super.key});

  @override
  ConsumerState<Statistic> createState() => _StatisticState();
}

class _StatisticState extends ConsumerState<Statistic> {
  Month month = Month.january;

  List<StatisticModel> selectedMonth = [];

  void onSelectedMonth(Month newMonth) {
    selectedMonth.clear();
    month = newMonth;
    setState(() {
      //no-op
    });
  }

  void addStatisticButtonTap() {
    modalBottomSheet(
      context,
      const AddStatistic(),
    ).whenComplete(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    final statistic = ref.watch(statisticProvider.notifier).repo?.getStatisticList();
    statistic?.forEach((element) {
      if (element.month == month) {
        if (selectedMonth.contains(element)) return;
        selectedMonth.add(element);
      }
    });

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: AppBarWidget(title: l10n.statistic)),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),
                if (statistic?.length == 0)
                  SliverToBoxAdapter(
                    child: EmptyIndicator(
                      title: l10n.addMonthExperience,
                      onPressed: addStatisticButtonTap,
                    ),
                  )
                else ...[
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 36,
                      child: IntrinsicHeight(
                        child: OverflowBox(
                          maxWidth: MediaQuery.sizeOf(context).width,
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: Month.values
                                  .map(
                                    (e) => Padding(
                                      padding: const EdgeInsets.only(right: 6),
                                      child: SmallButton(
                                        onTap: () => onSelectedMonth(e),
                                        title: e.asValue(context),
                                        backgroundColor: e != month
                                            ? AppColors.primaryColor.withOpacity(0.5)
                                            : AppColors.primaryColor,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 20),
                  ),
                  SliverGrid.builder(
                    itemBuilder: (context, index) {
                      final order = index % 4;
                      return OptionsCard(
                        title: selectedMonth[index].type,
                        icons: Text(
                          selectedMonth[index].timeSpent.toString(),
                          style: textTheme.titleLarge?.copyWith(
                            color: order == 0 || order == 3
                                ? AppColors.primaryColor
                                : AppColors.whiteColor,
                          ),
                        ),
                        backgroundColor: order == 1 || order == 2 ? AppColors.primaryColor : null,
                      );
                    },
                    itemCount: selectedMonth.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                  ),
                ],
              ],
            ),
            Positioned(
              bottom: 18,
              right: 22,
              child: SmallButton(
                onTap: addStatisticButtonTap,
                title: l10n.addStatistics,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
