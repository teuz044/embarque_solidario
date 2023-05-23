import 'package:mysql1/mysql1.dart';

Future<void> main() async {
  final settings = ConnectionSettings(
    host: 'localhost',
    port: 3307,
    user: 'seu_usuario',
    password: 'sua_senha',
    db: 'nome_do_banco_de_dados',
  );

  final conn = await MySqlConnection.connect(settings);


  await conn.close();
}
