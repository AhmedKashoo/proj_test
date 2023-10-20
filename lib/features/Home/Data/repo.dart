
import 'package:mysql1/mysql1.dart';

class MySQLConnection {
  static Future<MySqlConnection> getConnection() async {


    final settings = ConnectionSettings(
      host: "172.245.23.181",
      port: 3306,
      user: "user12",
      password: "/*user@23*-",
      db: "worker",

    );

    return await MySqlConnection.connect(settings);

  }
}
