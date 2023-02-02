
import 'package:core_project/core/common/constants/app_constants.dart';
import 'package:core_project/core/common/services/database_query.dart';
import 'package:core_project/core/logic/errors/app_exceptions.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHandler {
  DatabaseHandler._();
  
  static final DatabaseHandler _instance = DatabaseHandler._();
  factory DatabaseHandler() => DatabaseHandler._instance;

  Future<Database> getDatabase() async => await openDatabase(AppConstants.dbPath);



  /// It creates the tables in the database.
  Future<void> createTables() async {
    final Database database = await getDatabase();
  
    await database.transaction((db) async {
      DatabaseQuery query = DatabaseQuery(db);

      /// Creates user table
      await query.createUserTable();
      
    });

    await database.close();
  }

  Future<bool?> batch(String table, List<Map<String, dynamic>> listData) async {
    try{
      final database = await getDatabase();

      final batch = database.batch();

      for (var element in listData) {
        batch.insert(table, element, conflictAlgorithm: ConflictAlgorithm.replace);
      }

      await batch.commit();

      return true;
    }
    catch(e){
      throw DatabaseExceptions(message: e.toString());
    }
  }
}


/// An extension method that is used to count the number of rows in a table.
extension Count on Database {
  Future<int> count(String table, {String? aditionalWhere}) async {
    try{
      var response = await query(table, columns: ['count()'], where: aditionalWhere);
      return (response.first['count()'] as num).toInt(); 
    }
    catch(err){
      return 0;
    }
  }
}