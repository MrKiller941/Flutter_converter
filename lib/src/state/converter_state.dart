class ConverterState {
  final int inputBase;
  final int outputBase;
  final String inputNumber;
  final String? outputNumber;
  final String status;

  ConverterState(
      {required this.inputBase,
      required this.outputBase,
      required this.inputNumber,
      required this.outputNumber,
      required this.status});

  factory ConverterState.initialState() {
    return ConverterState(
        inputBase: 10,
        outputBase: 2,
        inputNumber: '',
        outputNumber: '',
        status: "init");
  }

  ConverterState copyWith(
      {int? inputBase,
      int? outputBase,
      String? inputNumber,
      String? outputNumber,
      String? status}) {
    return ConverterState(
      inputBase: inputBase ?? this.inputBase,
      outputBase: outputBase ?? this.outputBase,
      inputNumber: inputNumber ?? this.inputNumber,
      outputNumber: outputNumber ?? this.outputNumber,
      status: status ?? this.status,
    );
  }
}
