import 'data_service.dart';
import 'dummy_data_service.dart';

class DataAccessor {
  static final DataService instance = DummyDataService();
}