part of 'feadback_cubit.dart';

abstract class FeadbackState {}

final class FeadbackInitial extends FeadbackState {}
//FeadBackGetLoading

class FeadBackGetLoading extends FeadbackState {}

class FeadBackGetSuccess extends FeadbackState {
  final List<FeadbacksModel?> feadBacks;

  FeadBackGetSuccess({required this.feadBacks});
}

class FeadBackGetError extends FeadbackState {
  final String error;

  FeadBackGetError({required this.error});
}
