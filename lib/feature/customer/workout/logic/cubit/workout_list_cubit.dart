import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'workout_list_state.dart';

class WorkoutListCubit extends Cubit<WorkoutListState> {
  WorkoutListCubit() : super(WorkoutListInitial());
}
