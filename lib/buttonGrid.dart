import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonGrid extends StatelessWidget {

  final Function buttonPressHandler;

  ButtonGrid({this.buttonPressHandler});

  Widget calcButton(String txt, Function f) {
    return Expanded(
        child: new MaterialButton(
          padding: new EdgeInsets.all(16.0),
          child: new Text(txt),
          onPressed:  () => f(txt),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return  new Column(
      children: [
        new Row(
          children: [
            calcButton('sin',buttonPressHandler),
            calcButton('cos',buttonPressHandler),
            calcButton('tan',buttonPressHandler),
            calcButton('!', buttonPressHandler)
          ],
        ),
        new Row(
          children: [
            calcButton('sin⁻¹',buttonPressHandler),
            calcButton('cos⁻¹',buttonPressHandler),
            calcButton('tan⁻¹',buttonPressHandler),
            calcButton('%',buttonPressHandler)
          ],
        ),

        new Row(
          children: [
            calcButton('√',buttonPressHandler),
            calcButton('ⁿ√',buttonPressHandler),
            calcButton('ln',buttonPressHandler),
            calcButton('log',buttonPressHandler)
          ],
        ),
        new Row(
          children: [
            calcButton('π',buttonPressHandler),
            calcButton('e',buttonPressHandler),
            calcButton('ʸ⁄ₓ',buttonPressHandler),
            calcButton('xʸ',buttonPressHandler)
          ],
        ),
        new Row(
          children: [
            calcButton('C',buttonPressHandler),
            calcButton('(',buttonPressHandler),
            calcButton(')',buttonPressHandler),
            calcButton('÷',buttonPressHandler)
          ],
        ),
        new Row(
          children: [
            calcButton('7',buttonPressHandler),
            calcButton('8',buttonPressHandler),
            calcButton('9',buttonPressHandler),
            calcButton('×',buttonPressHandler)
          ],
        ),
        new Row(
          children: [
            calcButton('4',buttonPressHandler),
            calcButton('5',buttonPressHandler),
            calcButton('6',buttonPressHandler),
            calcButton('-',buttonPressHandler)
          ],
        ),
        new Row(
          children: [
            calcButton('1',buttonPressHandler),
            calcButton('2',buttonPressHandler),
            calcButton('3',buttonPressHandler),
            calcButton('+',buttonPressHandler)
          ],
        ),
        new Row(
          children: [
            calcButton('0',buttonPressHandler),
            calcButton('.',buttonPressHandler),
            calcButton('ans',buttonPressHandler),
            calcButton('=',buttonPressHandler)
          ],
        )
      ],
    );
  }

}