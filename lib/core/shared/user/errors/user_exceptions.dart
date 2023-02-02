import 'package:core_project/core/shared/user/errors/user_failures.dart';

/// It's an exception that is thrown when the user fails
class UserException extends UserFailure {
  UserException(String failureMessage): super(failureMessage);
}

/// It's an exception that is thrown when the user token is not found
class UserTokenNotFoundException extends UserException {
  UserTokenNotFoundException(String failureMessage): super(failureMessage);
}

/// It's an exception that is thrown when the user could not get the token
class UserCouldNotGetTokenException extends UserException {
  UserCouldNotGetTokenException(String failureMessage): super(failureMessage);
}