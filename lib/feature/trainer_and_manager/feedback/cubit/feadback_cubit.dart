import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';
import 'package:gem_app2/models/feadbacks/feadbacks_model.dart';

part 'feadback_state.dart';

class FeadbackCubit extends Cubit<FeadbackState> {
  FeadbackCubit() : super(FeadbackInitial());

  static FeadbackCubit get(context) => BlocProvider.of(context);

  // get feadback

  void getFeadback() async {
    emit(FeadBackGetLoading());
    try {
      List<FeadbacksModel?> feadBacks =
          await FirebaseFireStoreService.getDocsData<FeadbacksModel>(
        tableName: TablesName.feadBack,
        fromJson: FeadbacksModel.fromJson,
      );
      feadBacks.sort((a, b) {
        return a!.userName.toLowerCase().compareTo(b!.userName.toLowerCase());
      });
      emit(FeadBackGetSuccess(feadBacks: feadBacks));
    } catch (e) {
      emit(FeadBackGetError(error: e.toString()));
    }
  }
}
