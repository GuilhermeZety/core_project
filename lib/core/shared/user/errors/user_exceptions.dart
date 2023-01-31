import 'package:core_project/core/shared/user/errors/user_failures.dart';

class UserException extends UserFailure {
  UserException(String failureMessage): super(failureMessage);
}

class UserTokenNotFoundException extends UserException {
  UserTokenNotFoundException(String failureMessage): super(failureMessage);
}

class UserCouldNotGetTokenException extends UserException {
  UserCouldNotGetTokenException(String failureMessage): super(failureMessage);
}