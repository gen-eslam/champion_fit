part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {}

final class RegisterError extends RegisterState {
  final String message;
  RegisterError(this.message);
}
final class AddInfoSuccess extends RegisterState {}

final class AddInfoError extends RegisterState {
  final String message;
  AddInfoError(this.message);
}
// get image
final class PickImageSuccess extends RegisterState {}
final class PickImageError extends RegisterState {
  final String message;
  PickImageError(this.message);
}