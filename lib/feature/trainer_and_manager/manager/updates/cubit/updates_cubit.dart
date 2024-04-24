import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/feature/payment/model/payment_model.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';
import 'package:gem_app2/models/user_model.dart';

part 'updates_state.dart';

class UpdatesCubit extends Cubit<UpdatesState> {
  UpdatesCubit() : super(UpdatesInitial());

  static UpdatesCubit get(context) => BlocProvider.of(context);

  void getAllUsers() async {
    emit(GetAllUserLoading());
    try {
      var result = await FirebaseFireStoreService.getDocsData<PaymentModel>(
          tableName: TablesName.payment,
     
          fromJson: PaymentModel.fromJson);
      print(result.length);
      emit(GetAllUserSucess(userModel: result));
    } catch (e) {
      emit(GetAllUserError(error: e.toString()));
    }
  }
}
