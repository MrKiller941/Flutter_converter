import 'package:converter/src/domain/decimal_converter.dart';
import 'package:converter/src/domain/i_number_converter.dart';
import 'package:converter/src/domain/invalid_input_exception.dart';
import 'package:converter/src/domain/number_utils.dart';

class NumberConverter implements INumberConverter {
  final converter = DecimalConverter();

  @override
  String? convert(String number, int fromBase, int toBase) {
    if (!NumberUtils.isValidInput(number, fromBase)) {
      throw InvalidInputException();
    }
    if (fromBase == toBase) return number;

    int decimal = converter.convertToDecimal(number, fromBase);
    String convertedNumber = converter.convertFromDecimal(decimal, toBase);

    return convertedNumber;
  }
}
