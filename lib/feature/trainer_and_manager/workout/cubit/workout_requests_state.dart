part of 'workout_requests_cubit.dart';

abstract class WorkoutRequestsState {}

final class WorkoutRequestsInitial extends WorkoutRequestsState {}

final class WorkoutRequestsLoading extends WorkoutRequestsState {}

final class WorkoutRequestsSuccess extends WorkoutRequestsState {
  final List<CustomWorkoutModel> customWorkoutModels;
  WorkoutRequestsSuccess({required this.customWorkoutModels});
}

final class WorkoutRequestsError extends WorkoutRequestsState {
  final String message;
  WorkoutRequestsError({required this.message});
}
