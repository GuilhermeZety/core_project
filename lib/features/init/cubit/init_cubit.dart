
import 'package:bloc/bloc.dart';
part 'init_state.dart';
//TODO: Cubit
// Continua o mesmo
class InitCubit extends Cubit<InitState> {
  InitCubit(): super(InitInitial());

  bool isLoading = false;

  void init() async {
    emit(InitLoading());

    Future.delayed(Duration(seconds: 1), () {
      isLoading = false;
      emit(InitSuccess());
    });

  }
}
