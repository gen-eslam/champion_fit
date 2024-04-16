import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';
import 'package:gem_app2/models/feadbacks/feadbacks_model.dart';

part 'fead_back_state.dart';

class FeadBackCubit extends Cubit<FeadBackState> {
  FeadBackCubit() : super(FeadBackInitial());

  static FeadBackCubit get(context) => BlocProvider.of(context);
  TextEditingController feadBackController = TextEditingController();

  void sendFeadBack(FeadbacksModel feadback) {
    emit(FeadBackSendLoading());

    try {
      FirebaseFireStoreService.addData(
        tableName: TablesName.feadBack,
        data: feadback.toJson(),
      );
      emit(FeadBackSendSuccess());
    } catch (e) {
      emit(FeadBackSendError());
    }
  }
}
