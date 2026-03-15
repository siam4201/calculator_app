double calculate({
  required String symbol,
  required double num1,
  required double num2,
}) {
  return switch (symbol) {
    '+' => num1 + num2,
    '-' => num1 - num2,
    '*' => num1 * num2,
    '/' => (num1 ~/ num2).toDouble(),
    '%' => (num1 % num2).toDouble(),
    _ => 0.0,
  };
}
