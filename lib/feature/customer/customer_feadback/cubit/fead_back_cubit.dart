import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gem_app2/core/helpers/keys.dart';
import 'package:gem_app2/core/services/cache/cache_service.dart';
import 'package:gem_app2/firebase/firebase_firestore_service.dart';
import 'package:gem_app2/firebase/tables_name.dart';
import 'package:gem_app2/models/feadbacks/feadbacks_replay_model.dart';

part 'fead_back_state.dart';

class FeadBackCubit extends Cubit<FeadBackState> {
  FeadBackCubit() : super(FeadBackInitial());

  static FeadBackCubit get(context) => BlocProvider.of(context);
  TextEditingController feadBackController = TextEditingController();

  void getFeadBack() async {
    emit(FeadBackGetLoading());
    try {
      List<FeadBackReplayModel?> feadBacks =
          await FirebaseFireStoreService.getFilteredData<FeadBackReplayModel>(
        tableName: TablesName.feedBackReplies,
        fromJson: FeadBackReplayModel.fromJson,
        pram: 'uid',
        pramValue: CacheService.getDataString(key: Keys.userId),
      );
      emit(FeadBackGetSuccess(feadBacks: feadBacks));
    } catch (e) {
      emit(FeadBackGetError(error: e.toString()));
    }
  }
}
