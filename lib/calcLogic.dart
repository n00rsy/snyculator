import 'package:math_expressions/math_expressions.dart';

class CalcLogic {

  ContextModel cm = ContextModel();
  Variable ans = Variable('ans');
  Parser p = Parser();

  bool clear = true;

  CalcLogic(){
    cm.bindVariable(ans, Number(0));
  }

  bool isInteger(num value) =>
      value is int || value == value.roundToDouble();

  updateExpression(String exp, String b) {
    String _output = clear ? "" : exp;
    clear = false;
    switch(b) {
      case "C": {_output = ""; clear = true;}
      break;

      case "=": {_output = evaluateExpression(_output); clear = true;}
      break;

      default: {_output+=b;}
      break;
    }
    return _output;
  }

  evaluateExpression(String exp) {

    exp = exp.replaceAll("×", "*");
    exp = exp.replaceAll("÷", "/");

    try {
      Expression expression = p.parse(exp);

    dynamic res = expression.evaluate(EvaluationType.REAL, cm);

    if(res is double && res != double.infinity && res != double.nan) {
      cm.bindVariable(ans, Number(res));
      return isInteger(res) ? res.toInt().toString() : res.toString();
    }
    return res.toString();
    }
    catch (e) {
      String error = e.toString();
      return error.substring(error.indexOf(":")+2);
    }
  }

}