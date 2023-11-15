import 'package:converter/src/domain/number_converter.dart';
import 'package:converter/src/state/converter_actions.dart';
import 'package:converter/src/state/converter_state.dart';

final converter = NumberConverter();

ConverterState reducer(ConverterState state, dynamic action) {
  switch (action) {
    case ConverterUpdateInputBaseAction():
      return state.copyWith(inputBase: action.inputBase);
    case ConverterUpdateOutputBaseAction():
      return state.copyWith(outputBase: action.outputBase);
    case ConverterUpdateInputNumberAction():
      return state.copyWith(inputNumber: action.inputNumber);
    case ConverterResetStatusAction():
      return state.copyWith(status: "init");
    case ConverterConvertAction():
      {
        try {
          final outputNumber = converter.convert(
              state.inputNumber, state.inputBase, state.outputBase);
          return state.copyWith(outputNumber: outputNumber, status: "success");
        } catch (e) {
          return state.copyWith(status: "error");
        }
      }
  }

  return state;
}
