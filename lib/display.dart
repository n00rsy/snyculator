
import 'package:flutter/material.dart';

import'segment.dart';

class Display extends StatelessWidget {

  final String exp;

  Display({this.exp});

  Widget displayExpression(String exp) {
    List<Widget> segments = new List();
    for(String s in exp.split("7")) {
      segments.add(Segment(exp:s, fontSize: 0,));
    }
    segments.add(Fraction(numerator: "3", denominator: "5555",fontSize: 1));
    segments.add(SqrtSegment(exp:"1+2+4+5", fontSize:0));

    return Container(
      child:Row(
        children:
          segments,
      )
    );
  }

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
        child: displayExpression(exp),
      );
  }
}