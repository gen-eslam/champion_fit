import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/core/helpers/keys.dart';
import 'package:gem_app2/core/services/cache/cache_service.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';
import 'package:gem_app2/models/user_model.dart';
part 'coustomer_personal_state.dart';

class CoustomerPersonalCubit extends Cubit<CoustomerPersonalState> {
  CoustomerPersonalCubit() : super(CoustomerPersonalInitial());

  static CoustomerPersonalCubit get(context) => BlocProvider.of(context);

  late UserModel userModel;

  void getUserData() async {
    try {
      emit(GetCustomerDataLoading());
      UserModel? userModel =
          await FirebaseFireStoreService.getOneData<UserModel>(
        tableName: TablesName.users,
        pram: "uid",
        pramValue: CacheService.getDataString(
          key: Keys.userId,
        ),
        fromJson: UserModel.fromJson,
      );
      print(userModel.toString());
      this.userModel = userModel!;
      emit(
        GetCustomerDataSuccess(userModel: userModel),
      );
    } catch (e) {
      emit(
        GetCustomerDataError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
