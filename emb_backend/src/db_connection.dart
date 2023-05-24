import 'package:mysql1/mysql1.dart';

class DbConnection {
  static Future<MySqlConnection> connect() async {
    final settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'admin',
      db: 'produtos_para_doacao',
    );

    final conn = await MySqlConnection.connect(settings);

    // Verificar se a conexão foi estabelecida com sucesso
    if (conn != null) {
      print('Conexão com o banco de dados estabelecida com sucesso!');
    } else {
      print('Falha ao estabelecer conexão com o banco de dados.');
    }

    return conn;
  }
}