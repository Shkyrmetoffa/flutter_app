import 'package:flutter/material.dart';
import '../extensions/extensions.dart';

class ContactUsForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              'Contact Us'.toUpperCase(),
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
              child:
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter your name!",
                  hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.blue),
                  enabledBorder: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.blue)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                ),
                onChanged: (value)
                  {
                    print(value);
                  },
              )
          ),
        ]));
  }
}

