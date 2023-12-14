import 'package:converter/src/domain/history/result.dart';

abstract class IConverterHistory {
  Future<List<Result>> getHistory();
}