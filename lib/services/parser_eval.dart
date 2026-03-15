import 'calculate.dart';
import 'tokenizer.dart';

double parser(String math) {
  var tokenized = tokenizer(math: math);
  List<double> number = [];
  List<String> operator = [];
  Map<String, double> precedence = {'/': 2, '*': 2, '+': 1, '-': 1};

  void eval() {
    double a = number.removeLast();
    double b = number.removeLast();
    String x = operator.removeLast();

    number.add(calculate(num1: b, num2: a, symbol: x));
  }

  for (int i = 0; i < tokenized.length; i++) {
    var token = tokenized[i];

    if (token == ';') {
      break;
    }
    if (token == ',') {
      continue;
    }
    if (num.tryParse(token) != null) {
      number.add(double.parse(token));
    } else if (token == '(') {
      operator.add(token);
    } else if (token == ')') {
      while (operator.isNotEmpty && operator.last != '(') {
        eval();
      }
      operator.removeLast();
    } else {
      while (operator.isNotEmpty &&
          operator.last != '(' &&
          precedence[operator.last]! >= precedence[token]!) {
        eval();
      }
      operator.add(token);
    }
  }

  while (operator.isNotEmpty) {
    eval();
  }

  return number.last;
}
