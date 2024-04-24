import 'package:bloc/bloc.dart';
import 'package:gem_app2/feature/notification/notification_model.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';
import 'package:meta/meta.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  void getNotification() async {
    emit(NotificationLoading());
    try {
      List<NotificationModel> notificationList =
          await FirebaseFireStoreService.getDocsData<NotificationModel>(
              tableName: TablesName.notification,
              fromJson: NotificationModel.fromJson);
      print(notificationList.length);
      emit(NotificationLoaded(notificationList: notificationList));
    } catch (e) {
      emit(NotificationError(error: e.toString()));
    }
  }
}
