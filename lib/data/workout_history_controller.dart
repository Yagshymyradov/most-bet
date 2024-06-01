import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'service/workout_history_repo.dart';
import 'workout_history_model.dart';

final workoutHistoryRepoProvider = Provider<WorkoutHistoryRepo>(
      (ref) => WorkoutHistoryRepo(),
);

final workoutHistoryProvider = StateNotifierProvider<WorkoutHistoryController, List<WorkoutHistoryModel>?>(
  WorkoutHistoryController.new,
);

class WorkoutHistoryController extends StateNotifier<List<WorkoutHistoryModel>?> {
  WorkoutHistoryRepo? repo;

  final StateNotifierProviderRef<dynamic, dynamic> ref;

  WorkoutHistoryController(this.ref) : super(null) {
    repo = ref.read(workoutHistoryRepoProvider);
    getWorkout();
  }

  void getWorkout() {
    state = repo!.getWorkoutList();
  }

  void addWorkout(WorkoutHistoryModel workout) {
    state = repo!.addToWorkoutList(workout);
  }

  void updateWorkout(int index, WorkoutHistoryModel workout) {
    state = repo!.updateWorkoutList(index, workout);
  }

  void removeFavorite(String id) {
    state = repo!.removeFromWorkoutList(id);
  }
}
