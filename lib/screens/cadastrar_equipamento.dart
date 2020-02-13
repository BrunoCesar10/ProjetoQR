import 'package:flutter/material.dart';
import 'package:qr_code_control/database/dao/equipamento_dao.dart';
import 'package:qr_code_control/models/equipamento.dart';

class CadastroEquipamentos extends StatefulWidget {
  @override
  _CadastroEquipamentosState createState() => _CadastroEquipamentosState();
}

class _CadastroEquipamentosState extends State<CadastroEquipamentos> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _localController = TextEditingController();
  final TextEditingController _cadastranteController = TextEditingController();
  final EquipamentoDao _dao = EquipamentoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar QR'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomeController,
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(labelText: 'Nome do Equipamento'),
            ),
            TextField(
              controller: _localController,
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(labelText: 'Local do Equipamento'),
            ),
            TextField(
              controller: _cadastranteController,
              style: TextStyle(fontSize: 16.0),
              decoration: InputDecoration(labelText: 'Nome do Cadastrante'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.redAccent[200],
                child: InkWell(
                  onTap: () {
                    final String nome = _nomeController.text;
                    final String local = _localController.text;
                    final String cadastrante = _cadastranteController.text;
                    final Equipamento equipamento =
                        Equipamento(0, nome, local, cadastrante);
                    _dao
                        .salvar(equipamento)
                        .then((id) => Navigator.pop(context));
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    height: 80,
                    width: double.maxFinite,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 32.0,
                        ),
                        Text(
                          'Criar',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
