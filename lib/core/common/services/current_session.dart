import 'package:core_project/core/shared/user/data/models/user_model.dart';
import 'package:core_project/core/shared/user/domain/usecases/local/user_local_usecase.dart';
import 'package:core_project/main.dart';
import 'package:flutter/material.dart';


class CurrentSession extends ChangeNotifier{
  //SingleTon
    CurrentSession._();
    static final CurrentSession _instance = CurrentSession._();
    factory CurrentSession() => CurrentSession._instance;
  //

  UserModel? _user;

  UserModel? get user => _user;

  /// A setter that updates the user variable and notifies the listeners.
  set user(UserModel? value) {
    _user = value;
    notifyListeners();
  }

 /// It gets the current logged user from the local storage and updates the user variable
  Future<void> updateCurrentUser() async {
    var response = await getIt<UserLocalUsecase>().getLogged();

    _user = response.fold((l) => null, (r) => r as UserModel);
    notifyListeners();
  }

}