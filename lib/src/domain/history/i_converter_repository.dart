import 'package:converter/src/domain/history/result.dart';

abstract class IConverterRepository {
  Future<List<Result>> getAll();
  Future<void> add(Result result);
}