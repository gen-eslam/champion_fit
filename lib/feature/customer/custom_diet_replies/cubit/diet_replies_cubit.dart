import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/core/helpers/keys.dart';
import 'package:gem_app2/core/services/cache/cache_service.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';
import 'package:gem_app2/models/coustom_diet_replayes_model.dart';
import 'package:meta/meta.dart';

part 'diet_replies_state.dart';

class DietRepliesCubit extends Cubit<DietRepliesState> {
  DietRepliesCubit() : super(DietRepliesInitial());

  static DietRepliesCubit get(context) => BlocProvider.of(context);

  void getReplies() async {
    emit(DietRepliesGetLoading());
    try {
      List<CustomDietRepliesModel?> feadBacks = await FirebaseFireStoreService
          .getFilteredData<CustomDietRepliesModel>(
        tableName: TablesName.customDitesReplies,
        fromJson: CustomDietRepliesModel.fromJson,
        pram: 'customerUid',
        pramValue: CacheService.getDataString(key: Keys.userId),
      );
      print(feadBacks.length);
      emit(DietRepliesGetSuccess(feadBacks: feadBacks));
    } catch (e) {
      emit(DietRepliesGetError(error: e.toString()));
    }
  }
}
