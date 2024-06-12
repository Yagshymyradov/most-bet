import 'package:hive/hive.dart';
import '../statistic_model.dart';

class StatisticRepo {
  String statistic = 'statistic';

  final _hive = Hive.box<StatisticModel>('statistic');

  StatisticRepo();

  List<StatisticModel>? getStatisticList() {
    return _hive.values.toList();
  }

  List<StatisticModel> addToStatisticList(StatisticModel statistic) {
    _hive.add(statistic);
    return _hive.values.toList();
  }

  List<StatisticModel> removeFromStatisticList(String id) {
    _hive.deleteAt(
      _hive.values.toList().indexWhere((element) => element.id == id),
    );
    return _hive.values.toList();
  }

  List<StatisticModel> updateStatisticList(int index, StatisticModel statistic) {
    _hive.putAt(index, statistic);
    return _hive.values.toList();
  }

  void deleteAll() {
    _hive.clear();
  }
}
