import 'package:flutter/material.dart';
import 'package:qr_code_control/database/dao/equipamento_dao.dart';
import 'package:qr_code_control/models/equipamento.dart';

class ListaEquipamentos extends StatefulWidget {
  @override
  _ListaEquipamentosState createState() => _ListaEquipamentosState();
}

class _ListaEquipamentosState extends State<ListaEquipamentos> {
  final EquipamentoDao _dao = EquipamentoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Equipamentos'),
        ),
        body: FutureBuilder<List<Equipamento>>(
            initialData: List(),
            future: _dao.buscarTodos(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                  break;
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                      ],
                    ),
                  );
                  break;
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                  final List<Equipamento> equipamentos = snapshot.data;
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Equipamento equipamento = equipamentos[index];
                      return ItemEquipamento(equipamento);
                    },
                    itemCount: equipamentos.length,
                  );
                  break;
              }
              return null;
            }));
  }
}

class ItemEquipamento extends StatelessWidget {
  final Equipamento equipamento;

  ItemEquipamento(this.equipamento);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.computer),
        title: Text(
          equipamento.nome,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          equipamento.local,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
    ;
  }
}
