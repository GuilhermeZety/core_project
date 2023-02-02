import 'package:sqflite/sqflite.dart';

class DatabaseQuery {
  final Transaction transaction;
  DatabaseQuery(this.transaction);

  /// It creates a user table if it doesn't exist
  Future<void> createUserTable() async {
    await transaction.execute(
      '''
      CREATE TABLE IF NOT EXISTS usuario (
        id INTEGER PRIMARY KEY,
        nome VARCHAR(255) NOT NULL,
        senha VARCHAR(255) NOT NULL,
        email VARCHAR(255) NOT NULL, 
        dataNascimento VARCHAR(255),
        foto VARCHAR(255), 
        logado INT(1) NOT NULL
      );
      '''
    );

    await transaction.execute(
      '''
      CREATE TABLE IF NOT EXISTS autenticacao (
        usuario_id INT(11) NOT NULL PRIMARY KEY,
        client_id VARCHAR(255) NOT NULL,
        client_secret VARCHAR(255) NOT NULL,
        grant_types VARCHAR(255) NOT NULL,
        access_token VARCHAR(255) NOT NULL,
        expires_in INT(11) NOT NULL,
        token_type VARCHAR(255) NOT NULL
      );
      '''
    );
  }
}
