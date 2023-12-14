class Result {
  final int inputBase;
  final int outputBase;
  final String inputNumber;
  final String outputNumber;

  Result({
    required this.inputBase, 
    required this.outputBase, 
    required this.inputNumber, 
    required this.outputNumber
  });

  factory Result.fromJson(Map<String, dynamic> json){
    return Result(
      inputBase: json['inputBase'],
      outputBase: json['outputBase'],
      inputNumber: json['inputNumber'],
      outputNumber: json['outputNumber']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'inputBase': inputBase,
      'outputBase': outputBase,
      'inputNumber': inputNumber,
      'outputNumber': outputNumber 
    };
  }
}