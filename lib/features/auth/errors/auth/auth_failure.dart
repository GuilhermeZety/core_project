
import 'package:core_project/core/logic/errors/app_failures.dart';

class AuthFailure extends AppFailures {
  AuthFailure({required super.failureMessage});
}

class InvalidNumberFailure extends AuthFailure {
  InvalidNumberFailure({required super.failureMessage});
}

class InvalidVerificationCodeFailure extends AuthFailure {
  InvalidVerificationCodeFailure({required super.failureMessage});
}

class NotInternetConnectionFailure extends AuthFailure {
  NotInternetConnectionFailure({required super.failureMessage});
}
