import 'package:flutter/material.dart';

class SertificateCheckScreen extends StatelessWidget {
  const SertificateCheckScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(),
        Container(
          padding: EdgeInsets.all(16),
          width: 300,
          height: 200,
          color: Colors.grey.withAlpha(200),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              RaisedButton(
                child: Text('Login'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}