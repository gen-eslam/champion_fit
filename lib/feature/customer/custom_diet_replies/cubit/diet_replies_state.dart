part of 'diet_replies_cubit.dart';

@immutable
sealed class DietRepliesState {}

final class DietRepliesInitial extends DietRepliesState {}

class DietRepliesGetLoading extends DietRepliesState {}

class DietRepliesGetSuccess extends DietRepliesState {
  final List<CustomDietRepliesModel?> feadBacks;
  DietRepliesGetSuccess({required this.feadBacks});
}

class DietRepliesGetError extends DietRepliesState {
  final String error;
  DietRepliesGetError({required this.error});
}
