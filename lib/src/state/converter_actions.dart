class ConverterUpdateInputBaseAction {
  final int inputBase;

  ConverterUpdateInputBaseAction(this.inputBase);
}

class ConverterUpdateOutputBaseAction {
  final int outputBase;

  ConverterUpdateOutputBaseAction(this.outputBase);
}

class ConverterUpdateInputNumberAction {
  final String inputNumber;

  ConverterUpdateInputNumberAction(this.inputNumber);
}

class ConverterResetStatusAction {}

class ConverterConvertAction {}
