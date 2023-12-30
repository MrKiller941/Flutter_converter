import 'package:converter/src/domain/history/i_converter_history.dart';
import 'package:converter/src/domain/history/i_converter_repository.dart';
import 'package:converter/src/domain/history/result.dart';
import 'package:converter/src/infrastructure/data/database_results.dart';

class ConverterHistory implements IConverterHistory {

  final IConverterRepository repository = DatabaseResults();

  @override
  Future<List<Result>> getHistory() {
    return repository.getAll();
  }
 @override
  Future<void> deleteLast(int count) {
    return repository.deleteLast(count);
  }
}