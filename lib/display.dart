
import 'package:flutter/cupertino.dart';

class Display extends StatelessWidget {

  final String exp;

  Display({this.exp});

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.centerRight,
      padding: new EdgeInsets.only(
          top: 100.0,
          bottom: 20.0,
          right: 20.0,
        left: 20.0,
      ),
      child: FittedBox (
      fit: BoxFit.fitWidth,
        child: new Text(
          exp,
          style: new TextStyle(
              fontSize: 48.0,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}