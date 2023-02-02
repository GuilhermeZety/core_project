
import 'package:core_project/core/logic/errors/app_failures.dart';

/// It's an abstract class that defines the methods that a remote data source must implement
class UserFailure extends AppFailures {
  UserFailure(String failureMessage): super(failureMessage: failureMessage);
}