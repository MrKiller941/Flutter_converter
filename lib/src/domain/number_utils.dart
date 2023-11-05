class NumberUtils {
  static int? getDigitValue(String digit) {
    int value;

    try {
      value = int.parse(digit);
    } catch (e) {
      if (RegExp(r'^[a-zA-Z]+$').hasMatch(digit)) {
        value = digit.toUpperCase().codeUnitAt(0) - 'A'.codeUnitAt(0) + 10;
      } else {
        return null;
      }
    }
    return value;
  }

  static String? getDigitSymbol(int value) {
    String symbol;

    if (value >= 0 && value <= 9) {
      symbol = value.toString();
    } else if (value >= 10 && value < 36) {
      symbol = String.fromCharCode('A'.codeUnitAt(0) + (value - 10));
    } else {
      return null;
    }

    return symbol;
  }

  static bool isValidInput(String number, int base) {
    if (number.isEmpty) return false;
    for (int i = 0; i < number.length; i++) {
      String digit = number[i];
      if (!_isDigitValid(digit, base)) {
        return false;
      }
    }
    return true;
  }

  static bool _isDigitValid(String digit, int base) {
    int maxValue = base - 1;

    if (RegExp(r'^[0-9]$').hasMatch(digit)) {
      int value = int.parse(digit);
      return value <= maxValue;
    }

    int maxAlphaValue = base - 11;
    if (RegExp(r'^[a-zA-Z]$').hasMatch(digit)) {
      int value = digit.toUpperCase().codeUnitAt(0) - 'A'.codeUnitAt(0);
      return value <= maxAlphaValue;
    }

    return false;
  }
}
