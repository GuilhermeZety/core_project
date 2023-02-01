
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
part 'init_state.dart';

class InitCubit extends Cubit<InitState> {
  InitCubit(): super(InitInitial());

  bool isLoading = true;

  List<Uint8List> images = [];

  void init() async {
    emit(InitLoading());
    isLoading = false;
    emit(InitSuccess());
  }
}
