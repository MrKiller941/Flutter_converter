import 'package:converter/src/domain/converter/number_converter.dart';
import 'package:converter/src/domain/history/converter_history.dart';
import 'package:converter/src/domain/history/result.dart';
import 'package:flutter/widgets.dart';

final converter = NumberConverter();
final history = ConverterHistory();

class ConverterProvider with ChangeNotifier {
  int inputBase = 10;
  int outputBase = 2;
  String inputNumber = "";
  String? outputNumber = "";
  String status = "init";
  List<Result> savedResults = [];

  void setInputBase(int inputBase){
    this.inputBase = inputBase;
    notifyListeners();
  }

  void reverseBases(){
    final tempBase = inputBase;
    inputBase = outputBase;
    outputBase = tempBase;
    notifyListeners();
  }

  void setOutputBase(int outputBase){
    this.outputBase = outputBase;
    notifyListeners();
  }

  void setInputNumber(String inputNumber){
    this.inputNumber = inputNumber;
    notifyListeners();
  }

  void updateHistory() async {
    savedResults = await history.getHistory();
    notifyListeners();
  }

  void convert(){
    try {
      outputNumber = converter.convert(inputNumber, inputBase, outputBase);
      status = "success";
    } catch (e) {
      status = "error";
    }
    notifyListeners();
  }
}