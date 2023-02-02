
import 'package:bloc/bloc.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(): super(HomeInitial());
  bool isConsumer = true;
  bool isLoading = true;

  void init(context) async {
    emit(HomeLoading());
    isLoading = false;
    emit(HomeSuccess());
  }
}
