import 'package:core_project/features/auth/errors/auth/auth_failure.dart';

class AuthExceptions extends AuthFailure {
  AuthExceptions({required super.failureMessage});
}

class UserNotFoundException extends AuthFailure {
  UserNotFoundException({ required super.failureMessage });
}

class CouldNotInsertException extends AuthFailure {
  CouldNotInsertException({ required super.failureMessage });
}

class UserEmailNotFoundException extends AuthFailure {
  UserEmailNotFoundException({ required super.failureMessage });
}

class NotInternetConnectionException extends AuthFailure {
  NotInternetConnectionException({ required super.failureMessage });
}
