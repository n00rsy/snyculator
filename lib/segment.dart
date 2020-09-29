import 'package:flutter/material.dart';
import 'package:flutter_lifecycle/flutter_lifecycle.dart';

class Segment extends StatelessWidget {
  final fontSizes = [40.0, 35.0, 30.0];
  final controller = TextEditingController();

  final String exp;
  final int fontSize;

  Segment({this.exp, this.fontSize});

  Dispose _onInit(BuildContext context) {
    //if you need do something on dispose
    //return a Function()
    return () {
      print("on dispose");
    };
  }

  @override
  Widget build(BuildContext context) {
    print(controller.selection);
    controller.text = exp;
    return  Container(
        child: IntrinsicWidth(
            child: TextField(
      style: TextStyle(
        fontSize: fontSizes[fontSize],
      ),
      maxLines: 1,
      decoration: null,
      showCursor: true,
      readOnly: true,
      controller: controller,
    )));
  }
}

class SqrtSegment extends Segment {

  String exp;
  int fontSize;

  SqrtSegment({this.exp, this.fontSize});

  Widget sqrtBar() {
    return Divider(
      color: Colors.black,
      height: 0,
      thickness: 2.5,
      indent: 20,
    );
  }

  @override
  Widget build(BuildContext context) {
    exp = "√" + exp;
    return IntrinsicWidth(
        child: Column(
          children: [
            sqrtBar(),
            super.build(context)
          ],
        )
    );
  }
}

class Fraction extends StatelessWidget {
  final String numerator;
  final String denominator;
  final int fontSize;

  Fraction({this.numerator, this.denominator, this.fontSize});

  Widget fractionBar() {
    return Divider(
      color: Colors.black,
      height: 2,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
        child: Container(
            padding: new EdgeInsets.symmetric(horizontal: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Segment(
                  exp: numerator,
                  fontSize: fontSize,
                ),
                fractionBar(),
                Segment(
                  exp: denominator,
                  fontSize: fontSize,
                ),
              ],
            )
        )
    );
  }
}
