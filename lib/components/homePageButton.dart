import 'package:flutter/material.dart';

class HomePageButton extends StatelessWidget {
  HomePageButton({
    @required this.image,
    @required this.color,
    @required this.label,
    @required this.onPress});

  final image;
  final color;
  final String? label;
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
          onPressed: this.onPress,
          padding: EdgeInsets.only(top: 15, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,// Replace with a Row for horizontal icon + text
            children: <Widget>[
              Image(
                  image: this.image,
                  height: 60,
                  width: 60
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(this.label ?? '')
              )
            ],
          ),

          color: this.color,
          textColor: Colors.white,
        );
  }
}