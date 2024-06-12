import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'service/statistic_repo.dart';
import 'statistic_model.dart';

final statisticRepoProvider = Provider<StatisticRepo>(
      (ref) => StatisticRepo(),
);

final statisticProvider = StateNotifierProvider<StatisticController, List<StatisticModel>?>(
  StatisticController.new,
);

class StatisticController extends StateNotifier<List<StatisticModel>?> {
  StatisticRepo? repo;

  final StateNotifierProviderRef<dynamic, dynamic> ref;

  StatisticController(this.ref) : super(null) {
    repo = ref.read(statisticRepoProvider);
    getStatistic();
  }

  void getStatistic() {
    state = repo!.getStatisticList();
  }

  void addStatistic(StatisticModel statistic) {
    state = repo!.addToStatisticList(statistic);
  }

  void updateStatistic(int index, StatisticModel statistic) {
    state = repo!.updateStatisticList(index, statistic);
  }

  void removeStatistic(String id) {
    state = repo!.removeFromStatisticList(id);
  }
}
