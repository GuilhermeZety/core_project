import 'package:sqflite/sqflite.dart';

class DatabaseQuery {
  final Transaction transaction;
  DatabaseQuery(this.transaction);

  Future<void> createUserTable() async {
     await transaction.execute(
        '''
        CREATE TABLE IF NOT EXISTS usuario (
          id INTEGER PRIMARY KEY,
          matricula VARCHAR(255) NOT NULL, 
          nome VARCHAR(255) NOT NULL,
          senha VARCHAR(255) NOT NULL,
          email VARCHAR(255) NOT NULL, 
          documento VARCHAR(255), 
          cargo VARCHAR(255), 
          dataNascimento VARCHAR(255),
          dataAdmissao VARCHAR(255), 
          idioma VARCHAR(255), 
          foto VARCHAR(255), 
          logado INT(1) NOT NULL
        );
        '''
      );
      
      await transaction.execute(
        '''
        CREATE TABLE IF NOT EXISTS nivel (
          id INTEGER PRIMARY KEY,
          usuario_id INT(11) NOT NULL,
          nome VARCHAR(255) NOT NULL
        );
        '''
      );

      await transaction.execute(
        '''
        CREATE TABLE IF NOT EXISTS setor_alocado (
          id INTEGER PRIMARY KEY,
          usuario_id INT(11) NOT NULL,
          nome VARCHAR(255) NOT NULL,
          nomeHierarquico VARCHAR(255) NOT NULL
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

      await transaction.execute(
        '''
        CREATE TABLE IF NOT EXISTS usuario_permissao (
          usuario_id INT(11) NOT NULL,
          nome VARCHAR(255) NOT NULL,
          modulo VARCHAR(255) NOT NULL,
          temPermissao int(1) NOT NULL,
          PRIMARY KEY (usuario_id, nome, modulo)                
        );
        '''
      );

      await transaction.execute(
        '''
        CREATE TABLE IF NOT EXISTS usuario_atividade (
          id INTEGER PRIMARY KEY,
          usuario_id INT(11) NOT NULL,
          nome VARCHAR(255) NOT NULL
        );
        '''
      );

      await transaction.execute(
        '''
        CREATE TABLE IF NOT EXISTS usuario_atividade_permissao (
          usuario_id INT(11) NOT NULL,
          usuario_atividade_id INT(11) NOT NULL,
          nome VARCHAR(255) NOT NULL,
          temPermissao int(1) NOT NULL,
          PRIMARY KEY (usuario_id, usuario_atividade_id, nome)  
        );
        '''
      );
  }
}
