import 'package:flutter/material.dart';
import 'package:qr_code_control/screens/cadastrar_equipamento.dart';
import 'package:qr_code_control/screens/exibir_equipamentos.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 64.0),
              child: Image.asset('images/qrcodecontrol-logo.png'),
            ),
            SizedBox(
              width: double.maxFinite,
              child: RaisedButton(
                child: Text(
                    'Cadastrar Equipamento', style: TextStyle(fontSize: 20.0)),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => CadastroEquipamentos())
                  );
                },
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: RaisedButton(
                child: Text(
                    'Exibir Equipamentos', style: TextStyle(fontSize: 20.0)),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => ListaEquipamentos())
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
