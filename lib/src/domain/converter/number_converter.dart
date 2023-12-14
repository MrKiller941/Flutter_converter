import 'package:converter/src/domain/converter/decimal_converter.dart';
import 'package:converter/src/domain/history/i_converter_repository.dart';
import 'package:converter/src/domain/converter/i_decimal_converter.dart';
import 'package:converter/src/domain/converter/i_number_converter.dart';
import 'package:converter/src/domain/converter/invalid_input_exception.dart';
import 'package:converter/src/domain/converter/number_utils.dart';
import 'package:converter/src/domain/history/result.dart';
import 'package:converter/src/repository/database_results.dart';

class NumberConverter implements INumberConverter {
  final IDecimalConverter converter = DecimalConverter();
  final IConverterRepository repository = DatabaseResults();

  @override
  String? convert(String number, int fromBase, int toBase) {
    if (!NumberUtils.isValidInput(number, fromBase)) {
      throw InvalidInputException();
    }
    if (fromBase == toBase) {
      repository.add(Result(
        inputBase: fromBase,
        outputBase: toBase,
        inputNumber: number,
        outputNumber: number
      ));
      return number;
    }
    int decimal = converter.convertToDecimal(number, fromBase);
    String convertedNumber = converter.convertFromDecimal(decimal, toBase);
    repository.add(Result(
      inputBase: fromBase,
        outputBase: toBase,
        inputNumber: number,
        outputNumber: convertedNumber
    ));
    return convertedNumber;
  }
}
