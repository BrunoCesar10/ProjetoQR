import 'package:path/path.dart';
import 'package:qr_code_control/database/dao/equipamento_dao.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'qrcodecontrol.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(EquipamentoDao.tabela);
    },
    version: 1, onDowngrade: onDatabaseDowngradeDelete,
    //onDowngrade: onDatabaseDowngradeDelete,    ---> deleta o banco de dados ao fazer downgrade
  );
}