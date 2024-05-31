import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'service/workout_history_repo.dart';
import 'workout_history_model.dart';

final workoutHistoryRepoProvider = Provider<WorkoutHistoryRepo>(
      (ref) => WorkoutHistoryRepo(),
);

final workoutHistoryProvider = StateNotifierProvider<WorkoutHistoryController, List<WorkoutHistory>?>(
  WorkoutHistoryController.new,
);

class WorkoutHistoryController extends StateNotifier<List<WorkoutHistory>?> {
  WorkoutHistoryRepo? repo;

  final StateNotifierProviderRef<dynamic, dynamic> ref;

  WorkoutHistoryController(this.ref) : super(null) {
    repo = ref.read(workoutHistoryRepoProvider);
    getWorkout();
  }

  void getWorkout() {
    state = repo!.getWorkoutList();
  }

  void addWorkout(WorkoutHistory workout) {
    state = repo!.addToWorkoutList(workout);
  }

  void updateWorkout(WorkoutHistory workout) {
    state = repo!.updateWorkoutList(workout);
  }

  void removeFavorite(String id) {
    state = repo!.removeFromWorkoutList(id);
  }
}
