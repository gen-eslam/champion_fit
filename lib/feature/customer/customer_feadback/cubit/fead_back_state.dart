part of 'fead_back_cubit.dart';

abstract class FeadBackState {}

final class FeadBackInitial extends FeadBackState {}

final class FeadBackSendLoading extends FeadBackState {}

final class FeadBackSendSuccess extends FeadBackState {}

final class FeadBackSendError extends FeadBackState {}

final class FeadBackGetLoading extends FeadBackState {}

final class FeadBackGetSuccess extends FeadBackState {
  final List<FeadBackReplayModel?> feadBacks;

  FeadBackGetSuccess({required this.feadBacks});
}

final class FeadBackGetError extends FeadBackState {
  final String error;

  FeadBackGetError({required this.error});
}
