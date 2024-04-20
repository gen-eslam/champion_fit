part of 'updates_cubit.dart';

abstract class UpdatesState {}

final class UpdatesInitial extends UpdatesState {}

final class GetAllUserLoading extends UpdatesState {}

final class GetAllUserSucess extends UpdatesState {
  final List<UserModel?> userModel;
  GetAllUserSucess({required this.userModel});
}

final class GetAllUserError extends UpdatesState {
  String error;

  GetAllUserError({required this.error});
}
