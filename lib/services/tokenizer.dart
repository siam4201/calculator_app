List tokenizer({required String math}) {
  List tokenizedString = [];
  String number = '';

  for (int i = 0; i < math.length; i++) {
    if (num.tryParse(math[i]) != null || math[i] == '.') {
      number += math[i];
    } else {
      tokenizedString.add(math[i]);
      continue;
    }

    if (math[i + 1] != ';') {
      if (num.tryParse(math[i + 1]) == null) {
        tokenizedString.add(number);
        number = '';
        continue;
      }
    } else {
      if (num.tryParse(math[i]) != null) {
        tokenizedString.add(number);
        number = '';
      }
    }
  }

  return tokenizedString;
}
