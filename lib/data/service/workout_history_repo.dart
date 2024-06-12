import 'package:hive/hive.dart';

import '../workout_history_model.dart';

class WorkoutHistoryRepo {
  String workoutHistory = 'workout_history';

  final _hive = Hive.box<WorkoutHistoryModel>('workout_history');


  WorkoutHistoryRepo();

  List<WorkoutHistoryModel>? getWorkoutList() {
    return _hive.values.toList();
  }

  List<WorkoutHistoryModel> addToWorkoutList(WorkoutHistoryModel workout) {
    _hive.add(workout);
    return _hive.values.toList();
  }

  List<WorkoutHistoryModel> removeFromWorkoutList(String id) {
    _hive.deleteAt(
      _hive.values.toList().indexWhere((element) => element.id == id),
    );
    return _hive.values.toList();
  }

  List<WorkoutHistoryModel> updateWorkoutList(int index,WorkoutHistoryModel workout) {
    _hive.putAt(index, workout);
    return _hive.values.toList();
  }

  void deleteAll() {
    _hive.clear();
  }
}
