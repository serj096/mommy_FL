import 'data_service.dart';
import 'dummy_data_service.dart';

class DataAccessor {
  const DataAccessor._privateConstructor();

  static final DataService instance = DummyDataService();
}