import 'package:flutter/material.dart';
import 'package:snyculator/socketHandler.dart';

import 'calcLogic.dart';
import 'buttonGrid.dart';
import 'display.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Synculator',
      home: Scaffold(
        body: Synculator()
      )
    );
  }
}

class Synculator extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new SynculatorState();
}

class SynculatorState extends State<Synculator> {

  String exp = "0";

  CalcLogic calcLogic = new CalcLogic();
  SocketHandler socketHandler = new SocketHandler();

  calcButtonPress(String b){
      String _exp = calcLogic.updateExpression(exp, b);
      socketHandler.emitStateChange(_exp);
      setState(() {
        exp = _exp;
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
          children:<Widget> [
            Display(exp: exp),
            new Expanded(
                child: new Divider()
            ),
            ButtonGrid(buttonPressHandler: calcButtonPress)
          ]
      ),
    );
  }

}
