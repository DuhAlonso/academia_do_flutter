import 'package:mysql1/mysql1.dart';

class Database {
  Future<MySqlConnection> openConnection() {
    final settings = ConnectionSettings(
        host: 'localhost', port: 3306, user: 'root', db: 'dart_desafio_final');
    return MySqlConnection.connect(settings);
  }
}
