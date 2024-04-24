part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}

final class NotificationLoading extends NotificationState {}

final class NotificationLoaded extends NotificationState {
  final List<NotificationModel> notificationList;
  NotificationLoaded({
    required this.notificationList,
  });
}

final class NotificationError extends NotificationState {
  final String error;
  NotificationError({
    required this.error,
  });
}
