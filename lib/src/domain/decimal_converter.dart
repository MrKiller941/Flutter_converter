import 'dart:math';

import 'package:converter/src/domain/i_decimal_converter.dart';
import 'package:converter/src/domain/number_utils.dart';

class DecimalConverter implements IDecimalConverter {
  @override
  int convertToDecimal(String number, int fromBase) {
    int decimal = 0;
    int power = 0;

    for (int i = number.length - 1; i >= 0; i--) {
      int digit = NumberUtils.getDigitValue(number[i])!;

      decimal += digit * pow(fromBase, power).toInt();

      power++;
    }

    return decimal;
  }

  @override
  String convertFromDecimal(int decimal, int toBase) {
    String convertedNumber = '';

    while (decimal > 0) {
      int remainder = decimal % toBase;
      String digit = NumberUtils.getDigitSymbol(remainder)!;

      convertedNumber = digit + convertedNumber;

      decimal ~/= toBase;
    }

    return convertedNumber;
  }
}
