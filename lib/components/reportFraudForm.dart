import 'package:flutter/material.dart';
import '../extensions/extensions.dart';

class ReportFraudForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Report fraud'.toUpperCase(),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back, // add custom icons also
              ),
            ),
            backgroundColor: HexColor.fromHex('#28934b')),
        body: Stack(children: <Widget>[
          Container(
            color: HexColor.fromHex('#363636'),
          ),
        ]));
  }
}
