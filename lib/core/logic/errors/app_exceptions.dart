// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class AppExceptions implements Exception {
  final String message;
  AppExceptions({
    required this.message,
  });
}



class SyncExceptions extends AppExceptions {
  SyncExceptions({required super.message});
}

class DatabaseExceptions extends AppExceptions {
  DatabaseExceptions({required super.message});
}
