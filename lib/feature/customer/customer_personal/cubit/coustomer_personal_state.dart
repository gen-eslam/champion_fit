part of 'coustomer_personal_cubit.dart';

abstract class CoustomerPersonalState {}

final class CoustomerPersonalInitial extends CoustomerPersonalState {}

final class GetCustomerDataLoading extends CoustomerPersonalState {}

final class GetCustomerDataSuccess extends CoustomerPersonalState {
  UserModel userModel;
  GetCustomerDataSuccess({
    required this.userModel,
  });
}

final class GetCustomerDataError extends CoustomerPersonalState {
  String errorMessage;
  GetCustomerDataError({
    required this.errorMessage,
  });
}
