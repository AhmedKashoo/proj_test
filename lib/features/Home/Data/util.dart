
import 'package:mysql1/mysql1.dart';
import 'package:proj_test/features/Home/Data/repo.dart';

class MySQLUtil {
  static Future<List> executeQuery(String query) async {
    final conn = await MySQLConnection.getConnection();

    final results = await conn.query(query);
    await conn.close();

    return results.toList();
  }
  static Future<List> CheckBarCode(String query) async {
    final conn = await MySQLConnection.getConnection();

    final results = await conn.query(query);
    await conn.close();

    return results.toList();
  }

  static Future<List> GetCounter(String query) async {
    final conn = await MySQLConnection.getConnection();

    final results = await conn.query(query);
    await conn.close();

    return results.toList();
  }







}
