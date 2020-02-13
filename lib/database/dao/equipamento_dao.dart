import 'package:qr_code_control/database/database.dart';
import 'package:qr_code_control/models/equipamento.dart';
import 'package:sqflite/sqlite_api.dart';

class EquipamentoDao {

  static const String tabela = 'CREATE TABLE equipamentos('
      'id INTEGER PRIMARY KEY, '
      'nome TEXT, '
      'local TEXT, '
      'cadastrante TEXT)';

  static const String _nomeTabela = 'equipamentos';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _local = 'local';
  static const String _cadastrante = 'cadastrante';

  Future<int> salvar(Equipamento equipamento) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> mapaDeEquipamentos = Map();
    mapaDeEquipamentos[_nome] = equipamento.nome;
    mapaDeEquipamentos[_local] = equipamento.local;
    mapaDeEquipamentos[_cadastrante] = equipamento.cadastrante;
    return db.insert(_nomeTabela, mapaDeEquipamentos);
  }

  Future<List<Equipamento>> buscarTodos() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> resultado = await db.query(_nomeTabela);
    final List<Equipamento> equipamentos = List();
    for (Map<String, dynamic> row in resultado) {
      final Equipamento equipamento = Equipamento(
        row[_id],
        row[_nome],
        row[_local],
        row[_cadastrante],
      );
      equipamentos.add(equipamento);
    }
    return equipamentos;
  }
}