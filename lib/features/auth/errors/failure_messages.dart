
import 'package:core_project/core/logic/errors/app_failures.dart';
import 'package:core_project/features/auth/errors/auth/auth_exceptions.dart';

class Failure {
  final String message;

  Failure(this.message);

  AppFailures get exception => (() {
    switch(message) {
      case 'Não foi possível encontrar o usuário':
        throw UserNotFoundException(failureMessage: message);
      case 'É necessário conexão com a internet ao primeiro acesso':
        throw NotInternetConnectionException(failureMessage: message);
      case 'Nenhuma imagem no usuário':

      default:
        throw UnimplementedError();        
    }
  })();
}
