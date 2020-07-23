import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  HomePageButton({
    @required this.image,
    @required this.color,
    @required this.label,
    @required
  this.onPress});

  final String image;
  final color;
  final String label;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
          onPressed: this.onPress,
          padding: EdgeInsets.all(15.0),
          child: Column( // Replace with a Row for horizontal icon + text
            children: <Widget>[
              Image(
                  image: AssetImage(this.image),
                  height: 60,
                  width: 60
              ),
              Text(this.label)
            ],
          ),

          color: Color.fromARGB(255,234,136,52),
          textColor: Colors.white,
        );
  }
}