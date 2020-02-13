import 'package:flutter/material.dart';
import 'package:qr_code_control/database/dao/equipamento_dao.dart';
import 'package:qr_code_control/models/equipamento.dart';
import 'package:qr_code_control/screens/dashboard.dart';

void main() {
  runApp(QRCodeControl());
  final EquipamentoDao _dao = EquipamentoDao();
  _dao.buscarTodos().then((equipamentos) => debugPrint(equipamentos.toString()));
}

class QRCodeControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.redAccent[200],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.grey[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    );
  }
}

