import 'package:hive/hive.dart';

import '../workout_history_model.dart';



class WorkoutHistoryRepo {
  String workoutHistory = 'workout_history';

  final _hive = Hive.box<WorkoutHistory>('workout_history');


  WorkoutHistoryRepo();

  List<WorkoutHistory>? getWorkoutList() {
    return _hive.values.toList();
  }

  List<WorkoutHistory> addToWorkoutList(WorkoutHistory workout) {
    _hive.add(workout);
    return _hive.values.toList();
  }

  List<WorkoutHistory> removeFromWorkoutList(String id) {
    _hive.deleteAt(
      _hive.values.toList().indexWhere((element) => element.id == id),
    );
    return _hive.values.toList();
  }

  List<WorkoutHistory> updateWorkoutList(WorkoutHistory post) {
    _hive.put(workoutHistory, post);
    return _hive.values.toList();
  }

  void deleteAll() {
    _hive.clear();
  }
}
