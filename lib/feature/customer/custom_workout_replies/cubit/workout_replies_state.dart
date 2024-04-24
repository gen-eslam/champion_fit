part of 'workout_replies_cubit.dart';

@immutable
sealed class WorkoutRepliesState {}

final class WorkoutRepliesInitial extends WorkoutRepliesState {}
class WorkoutRepliesGetLoading extends WorkoutRepliesState {}

class WorkoutRepliesGetSuccess extends WorkoutRepliesState {
  final List<CustomWorkoutRepliesModel?> feadBacks;
  WorkoutRepliesGetSuccess({required this.feadBacks});
}

class WorkoutRepliesGetError extends WorkoutRepliesState {
  final String error;
  WorkoutRepliesGetError({required this.error});
}
