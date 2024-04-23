part of 'workout_schedule_cubit.dart';

abstract class WorkoutScheduleState {}

final class WorkoutScheduleInitial extends WorkoutScheduleState {}

final class WorkoutScheduleLoading extends WorkoutScheduleState {}

final class WorkoutScheduleSuccess extends WorkoutScheduleState {
  final List<WorkOutScheduleModel?> workOutScheduleModel;
  WorkoutScheduleSuccess({required this.workOutScheduleModel});
}

final class WorkoutScheduleError extends WorkoutScheduleState {
  final String error;
  WorkoutScheduleError({required this.error});
}
