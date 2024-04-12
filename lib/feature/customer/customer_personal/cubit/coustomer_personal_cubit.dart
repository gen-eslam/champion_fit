import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'coustomer_personal_state.dart';

class CoustomerPersonalCubit extends Cubit<CoustomerPersonalState> {
  CoustomerPersonalCubit() : super(CoustomerPersonalInitial());
}
