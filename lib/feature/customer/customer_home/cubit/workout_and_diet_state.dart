part of 'workout_and_diet_cubit.dart';

abstract class WorkoutAndDiteState {}

final class WorkoutAndDiteInitial extends WorkoutAndDiteState {}

final class DietDataLoading extends WorkoutAndDiteState {}

final class DietDataLoaded extends WorkoutAndDiteState {
  final List<DietModel> dietList;
  DietDataLoaded({
    required this.dietList,
  });
}

final class DietDataError extends WorkoutAndDiteState {
  final String message;
  DietDataError({required this.message});
}
